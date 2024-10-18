apt update
apt -y upgrade

apt -y install cowsay
apt -y install dnsutils
apt -y install git
apt -y install gparted
apt -y install htop
apt -y install neofetch
apt -y install parted
apt -y install vlc
apt -y purge kontact
apt -y purge libreoffice*
apt -y remove firefox-esr
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
apt-get remove -y aisleriot gnome-sudoku gnome-mahjongg ace-of-penguins gbrainy gnome-mines  four-in-a-row gnome-2048 gnome-weather gnome-chess five-or-more cheese gnome-nibbles quadrapassel tali gnome-taquin gnome-tetravex gnome-klotski iagno gnome-maps gnome-calendar gnome-contacts evolution hitori totem simple-scan gnome-music rhythmbox gnome-robots shotwell swell-foop gnome-clocks lightsoff gnome-sound-recorder


git config --global user.email "d.kastaniotis@iconic.gr"
git config --global user.name "Dimitris Kastaniotis"

for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt-get update
sudo apt-get -y install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
sudo apt update
sudo apt install fish

apt -y autoremove


