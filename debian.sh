apt update
apt -y upgrade

apt -y install dnsutils
apt -y install firefox-esr
apt -y install git
apt -y install gparted
apt -y install htop
apt -y install neofetch
apt -y install parted
apt -y install vlc
apt -y purge kontact
apt -y purge libreoffice*
apt -y remove akregator
apt -y remove ark
apt -y remove dragonplayer
apt -y remove gwenview
apt -y remove juk
apt -y remove k3b
apt -y remove kaccessible
apt -y remove kaddressbook
apt -y remove kate
apt -y remove kdepim-themeeditors
apt -y remove kfind
apt -y remove khelpcenter
apt -y remove kmail
apt -y remove knotes
apt -y remove konqueror
apt -y remove kopete
apt -y remove korganizer
apt -y remove kwrite
apt -y remove okular
apt -y remove packagekit
apt -y remove pim-data-exporter
apt -y remove pim-sieve-editor
apt -y remove sweeper

git config --global user.email "d.kastaniotis@iconic.gr"
git config --global user.name "Dimitris Kastaniotis"

curl -o vscode.deb -L http://go.microsoft.com/fwlink/?LinkID=760868
apt -y install -f ./vscode.deb
rm vscode.deb

apt -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
# apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
apt update
apt -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

systemctl disable NetworkManager-wait-online
systemctl disable docker

apt -y autoremove

cd /lib/modules/4.19.0-6-amd64/
find . -name *.ko -exec strip --strip-unneeded {} +
#Smaller but slower kernel load
#touch /etc/initramfs-tools/conf.d/compress
#echo COMPRESS=xz > /etc/initramfs-tools/conf.d/compress
sed -i 's/MODULES=most/MODULES=dep/' /etc/initramfs-tools/initramfs.conf
sudo update-initramfs -u

# TODO: check if files exist first
# echo "source /home/$USER/Documents/dotfiles/.bashrc" >> /home/$USER/.bashrc
# echo "source /home/$USER/Documents/dotfiles/.bash_aliases" >> /home/$USER/.bashrc
