#!/bin/bash
# If you think this is messy or you could do better, you're probably right. If you do, you should send it to me. Thanks :)

# Function to convert hex color to RGB
hex_to_rgb() {
  hex=$1
  r=$(echo $hex | cut -c 2-3)
  g=$(echo $hex | cut -c 4-5)
  b=$(echo $hex | cut -c 6-7)
  r=$((16#${r}))
  g=$((16#${g}))
  b=$((16#${b}))
  echo "$r $g $b"
}

# Function to calculate perceptual lightness (adjusted method)
lightness() {
  r=$1
  g=$2
  b=$3

  # Normalize RGB values to the [0, 1] range
  r=$(echo "scale=6; $r / 255" | bc -l)
  g=$(echo "scale=6; $g / 255" | bc -l)
  b=$(echo "scale=6; $b / 255" | bc -l)

  # Calculate the max and min of the normalized RGB values
  max=$(echo "$r $g $b" | tr " " "\n" | sort -nr | head -n 1)
  min=$(echo "$r $g $b" | tr " " "\n" | sort -n | head -n 1)

  # Calculate the lightness using a perceptually accurate formula
  lightness=$(echo "scale=6; ($max + $min) / 2" | bc -l)

  # Optionally: Apply a slight modifier to balance lightness perception
  # Adjust this value if lightness differentiation is still an issue
  modifier=$(echo "scale=6; ($max - $min) / 2" | bc -l)
  lightness=$(echo "scale=6; $lightness + $modifier" | bc -l)

  echo $lightness
}

# Parse colors from the pywal-generated CSS
COLOR0=$(grep -m 1 '@define-color color0' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR1=$(grep -m 1 '@define-color color1' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR2=$(grep -m 1 '@define-color color2' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR3=$(grep -m 1 '@define-color color3' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR4=$(grep -m 1 '@define-color color4' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR5=$(grep -m 1 '@define-color color5' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR6=$(grep -m 1 '@define-color color6' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR7=$(grep -m 1 '@define-color color7' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR8=$(grep -m 1 '@define-color color8' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR9=$(grep -m 1 '@define-color color9' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR10=$(grep -m 1 '@define-color color10' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR11=$(grep -m 1 '@define-color color11' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR12=$(grep -m 1 '@define-color color12' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR13=$(grep -m 1 '@define-color color13' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR14=$(grep -m 1 '@define-color color14' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
COLOR15=$(grep -m 1 '@define-color color15' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')

FOREGROUND=$(grep -m 1 '@define-color foreground' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
BACKGROUND=$(grep -m 1 '@define-color background' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')
CURSOR=$(grep -m 1 '@define-color cursor' ~/.cache/wal/colors-waybar.css | sed 's/.*#\(.*\);/\1/' | tr -d '\n' | tr -d ' ')

# Lightness threshold for deciding black or white
lightness_threshold=0.75

# Convert COLOR1 to RGB and calculate lightness
read r1 g1 b1 <<<$(hex_to_rgb $COLOR1)
l=$(lightness $r1 $g1 $b1)

# Print the lightness of COLOR1 for debugging
echo "Lightness of COLOR1 ($COLOR1): $l"

# Decide the best color (either white or black) based on lightness
if (($(echo "$l < $lightness_threshold" | bc -l))); then
  best_color_value="#000000" # black
else
  best_color_value="#FFFFFF" # white
fi

# Debug: Check the value of the best color
echo "Best color value: $best_color_value"

# Assign the best color as color16
color16=$best_color_value
echo "Color16: $color16"

# Backup original starship.toml in case we need to revert
cp ~/.config/starship.toml ~/dots/.config/starship.toml.bak

# Replace ~/.config/starship.toml with the temp file content
cp ~/.config/hypr/scripts/starshipwal/starship_temp.toml ~/dots/.config/starship.toml

# Replace the colors in the starship.toml file with the colors from the waybar CSS
sed -i "s/color10/#$COLOR10/g" ~/dots/.config/starship.toml
sed -i "s/color11/#$COLOR11/g" ~/dots/.config/starship.toml
sed -i "s/color12/#$COLOR12/g" ~/dots/.config/starship.toml
sed -i "s/color13/#$COLOR13/g" ~/dots/.config/starship.toml
sed -i "s/color14/#$COLOR14/g" ~/dots/.config/starship.toml
sed -i "s/color15/#$COLOR15/g" ~/dots/.config/starship.toml
sed -i "s/color0/#$COLOR0/g" ~/dots/.config/starship.toml
sed -i "s/color1/#$COLOR1/g" ~/dots/.config/starship.toml
sed -i "s/color2/#$COLOR2/g" ~/dots/.config/starship.toml
sed -i "s/color3/#$COLOR3/g" ~/dots/.config/starship.toml
sed -i "s/color4/#$COLOR4/g" ~/dots/.config/starship.toml
sed -i "s/color5/#$COLOR5/g" ~/dots/.config/starship.toml
sed -i "s/color6/#$COLOR6/g" ~/dots/.config/starship.toml
sed -i "s/color7/#$COLOR7/g" ~/dots/.config/starship.toml
sed -i "s/color8/#$COLOR8/g" ~/dots/.config/starship.toml
sed -i "s/color9/#$COLOR9/g" ~/dots/.config/starship.toml
sed -i "s/foreground/#$FOREGROUND/g" ~/dots/.config/starship.toml
sed -i "s/background/#$BACKGROUND/g" ~/dots/.config/starship.toml
sed -i "s/cursor/#$CURSOR/g" ~/dots/.config/starship.toml

# Add color16 to the starship.toml file
sed -i "s/contrast/$best_color_value/g" ~/dots/.config/starship.toml

echo "Colors updated in starship.toml."
