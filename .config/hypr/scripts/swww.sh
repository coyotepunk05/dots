!/usr/bin/env bash

DIR=~/.config/hypr/hyprpaperssss

echo $DIR

PICS=($(ls $DIR -I '*.json'))

#echo "$PICS"

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

swww query || swww init

echo Setting ${DIR}/${RANDOMPICS}

swww img ${DIR}/${RANDOMPICS} --transition-fps 60 --transition-type grow --transition-pos 0,1600 --transition-duration 3

pywalfox update

pywal-discord -p ~/.config/vesktop/themes -t pywal

wal -i "${DIR}/${RANDOMPICS}" -n
