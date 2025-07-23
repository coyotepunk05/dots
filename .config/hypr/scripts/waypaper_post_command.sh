#!/bin/bash

wallpaper="$1"

killall waypaper

wal -i "$wallpaper" -n -e

sleep 0.7s

swww img $wallpaper --transition-fps 60 --transition-type grow --transition-pos 0,1600 --transition-duration 3

pywalfox update

# cp ~/.cache/wal/cava.colors ~/.config/cava/config && cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css && cp ~/.cache/wal/colors-waybar.css ~/.config/wlogout/colors-waybar.css && cp ~/.cache/wal/colors-waybar.css ~/.config/hyprsw/colors-waybar.css && cp ~/.cache/wal/colors-waybar.css ~/.config/sherlock/colors-waybar.css

sh ~/.config/hypr/scripts/starshipwal/starshipwal_contrast.sh

touch ~/.config/waybar/style.css
