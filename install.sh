echo source /home/$USER/dotfiles/.bashrc >> ~/.bashrc
echo source /home/$USER/dotfiles/.bash_aliases >> ~/.bashrc

mkdir -p ~/.config/micro
ln -s ~/dotfiles/micro_settings.json ~/.config/micro/settings.json
