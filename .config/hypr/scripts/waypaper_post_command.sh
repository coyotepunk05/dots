#!/bin/bash

wallpaper="$1"

killall waypaper
swww img $wallpaper --transition-fps 60 --transition-type grow --transition-pos 0,1600 --transition-duration 3

wal -i "$wallpaper" -n -e

sleep 0.7s

pywalfox update

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css

swaync-client -rs

sh ~/.config/hypr/scripts/starshipwal/starshipwal_contrast.sh

pywal-discord

fcitx5-remote -e && fcitx5
# touch ~/.config/waybar/style.css
