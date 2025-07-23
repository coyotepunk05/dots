#!/bin/bash

# Toggle hyprsunset with temperature 4000 or kill it if running
if [ "$(hyprctl hyprsunset temperature)" = "6500" ]; then
  hyprctl hyprsunset temperature 3000
  echo "3000"
else
  hyprctl hyprsunset temperature 6500
  echo "6500"
fi
