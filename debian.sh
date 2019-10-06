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

apt -y autoremove
