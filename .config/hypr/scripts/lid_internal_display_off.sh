#!/bin/bash

# Get monitor names
connected_monitors=$(hyprctl monitors -j | jq -r '.[].name')
external_monitors=$(echo "$connected_monitors" | grep -v "eDP-1")

# Check if eDP-1 is active (not disabled)
is_enabled=$(hyprctl monitors -j | jq -r '.[] | select(.name == "eDP-1" and .disabled == false) | .name')

# Case 1: External monitors present, eDP-1 is still on
if [[ -n "$external_monitors" && "$is_enabled" == "eDP-1" ]]; then
  echo "Disabling eDP-1 via monitor=disable and suspending..."
  hyprctl keyword monitor "eDP-1,disable"
  sleep 1
  # systemctl suspend

# Case 2: No externals
elif [[ -z "$external_monitors" ]]; then
  echo "No external monitors — suspending anyway."
  systemctl suspend

# Case 3: Already disabled
else
  echo "eDP-1 already disabled. Nothing to do."
fi
