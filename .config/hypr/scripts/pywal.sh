#!/usr/bin/env bash

DIR=~/.config/hypr/hyprpaperssss
PICS=($(ls $DIR -I '*.json'))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

#wal -i "${DIR}/${RANDOMPICS}"
#pywalfox update
