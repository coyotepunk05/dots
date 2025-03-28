#!/bin/bash

# Toggle hyprsunset with temperature 4000 or kill it if running
if pkill -x "hyprsunset"; then
  echo "Hyprsunset terminated"
else
  hyprsunset -t 4000 &
  echo "Hyprsunset activated (4000K)"
fi
