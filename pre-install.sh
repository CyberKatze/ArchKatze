#!/bin/bash

HOME=$(readlink -f ./airootfs/home/live)

# Download and apply dotfiles
[ -d $HOME/.local/share/ ] && mkdir -p $HOME/.local/share
printf "\n\n" | chezmoi -c chezmoi.yaml init --exclude=scripts,encrypted --apply --force --no-tty https://github.com/cyberkatze/dotfiles

# Download fonts
[ -d $HOME/.fonts ] && mkdir -p $HOME/.fonts
git clone https://github.com/cyberkatze/fonts $HOME/.fonts

# Download wallpaper
[ -d $HOME/.fonts ] && mkdir -p $HOME/Pictures/Wallpapers
git clone https://github.com/cyberkatze/fav-wallpaper $HOME/Pictures/Wallpapers

# Download gtk icons and theme
[ -d $HOME/.icons ] && mkdir -p $HOME/Pictures/Wallpapers
git clone https://github.com/cyberkatze/gtk $HOME/gtk
mv $HOME/.icons $HOME/.theme $HOME
rm -rf $HOME/gtk

# Download Obsidian template
[ -d $HOME/Documents/Obsidian ] && mkdir -p $HOME/Documents/Obsidian
git clone https://github.com/cyberkatze/obsidian-cyberkatze $HOME/Documents/Obsidian/obsidian-cyberkatze

# Download AUR packages
./aur_download.sh
