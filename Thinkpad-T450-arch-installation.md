# Lenovo Thinkpad T450 Arch Linux Instalation

Always check Arch Wiki for latest changes. This guide might not work in a newer release 
https://wiki.archlinux.org/index.php/Installation_guide

## Burn iso into USB
``` bash
dd bs=4M if=path/to/archlinux.iso of=/dev/sdx status=progress oflag=sync
```

## Connect ethernet cable before booting to use active internet connection
## Check EFI boot mode
``` bash
ls /sys/firmware/efi/efivars
```
## Check internet
``` bash
ping www.google.com
```

## Update the system clock
``` bash
timedatectl set-ntp true
```

## Partition the disk (Single disk that is wiped, EFI and EXT4, no swap). Labels are added to simplify bootloader configuration
``` bash
lsblk

parted
(parted) select /dev/sda
(parted) mklabel gpt (!!!! WIPES THE DISK !!!)
(parted) mkpart primary fat32 1MiB 500MiB
(parted) set 1 esp on
(parted) mkpart primary ext4 500MiB 100%
(parted) quit

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

e2label /dev/sda2 SYSTEM
pacman -S dosfstools
fatlabel /dev/sda1 BOOT

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
```

## Install the base packages
``` bash 
pacstrap /mnt base linux linux-firmware
```

## Generate fstab with UUIDs and visually check everything is ok
``` bash
genfstab -U /mnt >> /mnt/etc/fstab
nano /mnt/etc/fstab
```

## Change root into the new system
``` bash 
arch-chroot /mnt
```

## Set time zone (you can type up to /zoneinfo/ and use tab to see contents instead of using ls in a separate command
``` bash 
ln -sf /usr/share/zoneinfo/Europe/Athens /etc/localtime
```

## Uncomment and generate locales, create the locale.conf
``` bash
pacman -S nano
nano /etc/locale.gen
locale-gen
echo LANG=en_US.UTF8 > /etc/locale.conf
```

## Network identifiers for dhcp network connection
``` bash
echo dimitris-t450 > /etc/hostname
echo 127.0.0.1 localhost >> /etc/hosts
echo ::1 localhost >> /etc/hosts
echo 127.0.1.1 dimitris-t450 >> /etc/hosts
```

## Set root password
``` bash 
passwd
```

## Install systemd-boot bootloader. Uses partition labels. This might stop working if you change those or change disks
``` bash
pacman -S efivar
efivar --list
bootctl --path=/boot install
rm /boot/loader/loader.conf
echo default arch-* > /boot/loader/loader.conf

pacman -S intel-ucode
```

/boot/loader/entries/arch.conf
``` bash
title   Arch Linux
linux   /vmlinuz-linux
initrd  /amd-ucode.img
initrd  /initramfs-linux.img
options root=LABEL=SYSTEM rw quiet loglevel=3 rd.systemd.show_status=auto rd.udev.log_priority=3 vga=current nvidia-drm.modeset=1
```

## Enable dhcpd and Reboot. 
``` bash
pacman -S dhcpcd
systemctl enable dhcpcd

reboot
```

## Create a user, add to groups and uncomment %wheel on visudo
``` bash 
useradd -m dimitris 
passwd dimitris
pacman -S sudo
usermod -aG wheel,audio,video,optical,storage,tty,users dimitris
groups dimitris
pacman -S vi
visudo
```

## Driver Installation as su
``` bash
pacman -S mesa
```

## Install desktop
``` bash
pacman -S xorg xorg-server
pacman -S plasma-meta
pacman -S inetutils

pacman -S inetutils cowsay neofetch

systemctl enable sddm

# nvidia driver is required for sddm to load properly
# pacman -S nvidia

pacman -S spectacle (for print screen)
pacman -S code (VS code)
pacman -S thunderbird
pacman -S libreoffice

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S anydesk
yay -S google-chrome
yay -S ttf-ms-fonts
yay -S ttf-vista-fonts

pacman -S docker
usermod -aG docker dimitris

```

## Troubleshooting:
### Slow network
sudo ethtool -s enp35s0 autoneg on speed 1000 duplex full
### nvidia tearing
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"

## Fix IPS white balance (Innolux seems to be ~1000K off. Set for Desktop Publishing???)
sudo pacman -S redshift  
reshift -x  
redshift -P -O 7800  
this adds the difference each time if not executed without the -x

Alternatively, put this into KDE startup with command 
'''redshift -o'''
And this to ~/.config/redshift/redshift.conf 
'''
[redshift]
temp-day=7500
temp-night=7000
fade=0
'''
There is a small delay on startup, but it works ok, and fixes the temp without manual setting


## TODO
- Document i915 parameters
- Document nvidia tearing fix
- Document service disabling
