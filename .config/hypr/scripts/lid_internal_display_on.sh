#!/bin/bash

HYPRLAND_CONFIG=~/.config/hypr/hyprland.conf

monitor_line=$(grep -E '^monitor\s*=\s*eDP-1' "$HYPRLAND_CONFIG" | head -n 1)

if [[ -z "$monitor_line" ]]; then
  echo "Monitor config for eDP-1 not found!"
  exit 1
fi

status=$(hyprctl monitors -j | jq -r '.[] | select(.name == "eDP-1") | .disabled')

if [[ "$status" == "true" || -z "$status" ]]; then
  echo "eDP-1 is disabled or missing — re-enabling."

  monitor_value="${monitor_line#monitor=}"

  hyprctl keyword monitor "$monitor_value"

  sleep 1
  hyprctl dispatch dpms on eDP-1
else
  echo "eDP-1 already active."
fi
