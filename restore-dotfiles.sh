#!/bin/bash

echo "Starting restoring config files"

rsync -axvh ./.zshrc $HOME/.zshrc
rsync -axvh ./.vimrc $HOME/.vimrc
rsync -axvh ./.config/alacritty/ $HOME/.config/alacritty/
rsync -axvh ./.config/dunst/ $HOME/.config/dunst/
rsync -axvh ./.config/fish/ $HOME/.config/fish/
rsync -axvh ./.config/i3/ $HOME/.config/i3/
rsync -axvh ./.config/kanshi/ $HOME/.config/kanshi/
rsync -axvh ./.config/kitty/ $HOME/.config/kitty/
rsync -axvh ./.config/nitrogen/ $HOME/.config/nitrogen/
rsync -axvh ./.config/mako/ $HOME/.config/mako/
rsync -axvh ./.config/nvim/ $HOME/.config/nvim/
rsync -axvh ./.config/picom/ $HOME/.config/picom/
rsync -axvh ./.config/qtile/ $HOME/.config/qtile/
rsync -axvh ./.config/polybar/ $HOME/.config/polybar/
rsync -axvh ./.config/ranger/ $HOME/.config/ranger/
rsync -axvh ./.config/redshift/ $HOME/.config/redshift/
rsync -axvh ./.config/rofi/ $HOME/.config/rofi/
rsync -axvh ./.config/sway/ $HOME/.config/sway/
rsync -axvh ./.config/swaylock/ $HOME/.config/swaylock/
rsync -axvh ./.config/termite/ $HOME/.config/termite/
rsync -axvh ./.config/waybar/ $HOME/.config/waybar/

echo "Restoring config files complete"
