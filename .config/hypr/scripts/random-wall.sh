#!/usr/bin/env bash
directory=~/.config/hypr/hyprpaperssss
monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')

if [ -d "$directory" ]; then
  random_background=$(ls $directory/*.jpg | shuf -n 1)
  #random_background=$(fd ".png|.jpg|.jpeg" $directory/ | shuf -n1)

  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload $random_background
  hyprctl hyprpaper wallpaper "$monitor, $random_background"

fi
