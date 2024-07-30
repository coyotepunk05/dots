#!/usr/bin/env bash

DIR=~/.config/hypr/hyprpaperssss

echo $DIR

PICS=($(ls $DIR -I '*.json'))

#echo "$PICS"

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

swww query || swww init

echo Setting ${DIR}/${RANDOMPICS}

swww img ${DIR}/${RANDOMPICS} --transition-fps 30 --transition-type any --transition-duration 3

sleep 3s

wal -i "${DIR}/${RANDOMPICS}"

pywalfox update
