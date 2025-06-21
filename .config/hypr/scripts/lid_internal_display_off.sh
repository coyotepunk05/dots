#!/bin/bash

connected_monitors=$(hyprctl monitors -j | jq -r '.[].name')
external_monitors=$(echo "$connected_monitors" | grep -v "eDP-1")

is_enabled=$(hyprctl monitors -j | jq -r '.[] | select(.name == "eDP-1" and .disabled == false) | .name')

if [[ -n "$external_monitors" && "$is_enabled" == "eDP-1" ]]; then
  echo "Disabling eDP-1."
  hyprctl keyword monitor "eDP-1,disable"

elif [[ -z "$external_monitors" ]]; then
  echo "No external monitors — suspending."
  systemctl suspend

else
  echo "eDP-1 already disabled. Nothing to do."
fi
