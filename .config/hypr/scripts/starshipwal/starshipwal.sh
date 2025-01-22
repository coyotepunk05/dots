#!/bin/bash

# Parse colors from the pywal-generated CSS
COLOR1=$(grep -m 1 '@define-color color1' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR2=$(grep -m 1 '@define-color color2' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR3=$(grep -m 1 '@define-color color3' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR4=$(grep -m 1 '@define-color color4' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR5=$(grep -m 1 '@define-color color5' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR6=$(grep -m 1 '@define-color color6' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')

# Debug: Print colors to verify they are extracted correctly
echo "COLOR1: $COLOR1"
echo "COLOR2: $COLOR2"
echo "COLOR3: $COLOR3"
echo "COLOR4: $COLOR4"
echo "COLOR5: $COLOR5"
echo "COLOR6: $COLOR6"

# Backup original starship.toml in case we need to revert
cp ~/.config/starship.toml ~/.config/starship.toml.bak

# Replace ~/.config/starship.toml with the temp file content
cp ~/.config/hypr/scripts/starshipwal/starship_temp.toml ~/.config/starship.toml

# Replace the colors in the starship.toml file with the colors from the waybar CSS
sed -i "s/color1/#$COLOR1/g" ~/.config/starship.toml
sed -i "s/color2/#$COLOR2/g" ~/.config/starship.toml
sed -i "s/color3/#$COLOR3/g" ~/.config/starship.toml
sed -i "s/color4/#$COLOR4/g" ~/.config/starship.toml
sed -i "s/color5/#$COLOR5/g" ~/.config/starship.toml
sed -i "s/color6/#$COLOR6/g" ~/.config/starship.toml

echo "Colors updated in starship.toml."
