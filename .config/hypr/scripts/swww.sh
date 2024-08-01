!/usr/bin/env bash

DIR=~/.config/hypr/hyprpaperssss

echo $DIR

PICS=($(ls $DIR -I '*.json'))

#echo "$PICS"

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

swww query || swww init

echo Setting ${DIR}/${RANDOMPICS}

swww img ${DIR}/${RANDOMPICS} --transition-fps 60 --transition-type any --transition-duration 3

wal -i "${DIR}/${RANDOMPICS}" -n

pywalfox update

pywal-discord -p ~/.config/vesktop/themes -t pywal
