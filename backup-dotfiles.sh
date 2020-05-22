#!/bin/bash

echo "Starting backing up config files"

rsync -axvh $HOME/.zshrc ./.zshrc
rsync -axvh $HOME/.vimrc ./.vimrc
rsync -axvh $HOME/.config/alacritty/ ./.config/alacritty/
rsync -axvh $HOME/.config/dunst/ ./.config/dunst/
rsync -axvh $HOME/.config/fish/ ./.config/fish/
rsync -axvh $HOME/.config/i3/ ./.config/i3/
rsync -axvh $HOME/.config/kitty/ ./.config/kitty/
rsync -axvh $HOME/.config/nitrogen/ ./.config/nitrogen/
rsync -axvh $HOME/.config/nvim/ ./.config/nvim/
rsync -axvh $HOME/.config/picom/ ./.config/picom/
rsync -axvh $HOME/.config/polybar/ ./.config/polybar/
rsync -axvh $HOME/.config/ranger/ ./.config/ranger/
rsync -axvh $HOME/.config/redshift/ ./.config/redshift/
rsync -axvh $HOME/.config/rofi/ ./.config/rofi/
rsync -axvh $HOME/.config/termite/ ./.config/termite/

echo "Backing up config files complete"
