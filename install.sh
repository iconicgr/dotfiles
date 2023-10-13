echo source /home/$USER/dotfiles/bash >> ~/.bashrc
echo source /home/$USER/dotfiles/aliases >> ~/.bashrc

mkdir -p ~/.config/micro
ln -s ~/dotfiles/micro_settings.json ~/.config/micro/settings.json
