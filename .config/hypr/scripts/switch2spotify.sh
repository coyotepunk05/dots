#!/bin/bash

workspace=$(hyprctl clients | grep -B 4 'class: Spotify' | grep 'workspace:' | awk '{print $2}')
activeworkspace=$(hyprctl activeworkspace -j | jq '.id')

echo $workspace
echo $activeworkspace

if [ "$workspace" = "$activeworkspace" ]; then
  hyprctl dispatch workspace previous
else
  hyprctl dispatch workspace "$workspace"
fi
