apt update
apt -y upgrade
apt -y install firefox-esr
apt -y install vlc
apt -y install htop
apt -y remove kaccessible
apt -y remove konqueror
apt -y purge libreoffice*
apt -y remove kate
apt -y install git
git config --global user.email "d.kastaniotis@iconic.gr"
git config --global user.name "Dimitris Kastaniotis"
apt -y install parted
apt -y install gparted

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
usermod -aG docker $USER

# apt remove vlc
apt -y remove packagekit
apt -y purge kontact
apt -y remove okular
apt -y remove gwenview
apt -y remove akregator
apt -y remove kmail
apt -y remove kopete
apt -y remove juk
apt -y remove korganizer
apt -y remove k3b
apt -y remove dragonplayer
apt -y remove ark
apt -y remove kfind
apt -y remove knotes
apt -y remove kwrite
apt -y remove sweeper
apt -y remove kaddressbook
apt -y remove kdepim-themeeditors
apt -y remove pim-sieve-editor
apt -y remove pim-data-exporter

apt -y install neofetch

systemctl disable NetworkManager-wait-online
systemctl disable docker

apt -y autoremove

echo "source /home/$USER/Documents/dotfiles/.bashrc" >> /home/$USER/.bashrc
echo "source /home/$USER/Documents/dotfiles/.bash_aliases" >> /home/$USER/.bashrc
