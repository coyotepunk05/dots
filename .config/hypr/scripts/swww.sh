#!/usr/bin/env bash

DIR=~/.config/hypr/hyprpaperssss

echo $DIR

PICS=($(ls $DIR))
#PICS=($(ls $DIR -I '*.json'))

#echo "$PICS"

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

swww query || swww init

echo Setting ${DIR}/${RANDOMPICS}

wal -i "${DIR}/${RANDOMPICS}" -n

sleep 0.7s

swww img ${DIR}/${RANDOMPICS} --transition-fps 60 --transition-type grow --transition-pos 0,1600 --transition-duration 3

pywalfox update

cp ~/.cache/wal/cava.colors ~/.config/cava/config && cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css && cp ~/.cache/wal/colors-waybar.css ~/.config/wlogout/colors-waybar.css && cp ~/.cache/wal/colors-waybar.css ~/.config/hyprsw/colors-waybar.css

killall hyprswitch && hyprswitch init --workspaces-per-row 4 --size-factor 4.5 --custom-css ~/.config/hyprsw/hyprsw.css &

pywal-discord -p ~/.config/vesktop/themes -t default

if pgrep -x "hyprswitch"; then
  pkill -x "hyprswitch"
else
  hyprswitch init --workspaces-per-row 4 --size-factor 4.5 --custom-css ~/.config/hyprsw/hyprsw.css &
fi
