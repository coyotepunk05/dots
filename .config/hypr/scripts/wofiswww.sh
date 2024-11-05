#!/usr/bin/env bash

# Directory containing your wallpapers
DIR="$HOME/.config/hypr/hyprpaperssss"

# Generate a list of wallpapers with image previews only
WALLPAPER_LIST=$(ls "$DIR" | while read -r file; do
  echo "img:$DIR/$file"
done)

# Use Wofi to select a wallpaper with previews
SELECTED_ENTRY=$(echo "$WALLPAPER_LIST" | wofi -c ~/.config/wofi/configswww -s ~/.config/wofi/styleswww.css --dmenu --prompt "Select Wallpaper" --allow-images --width 900 --height 900 -w 4)

# Extract the selected wallpaper filename and store it in a variable
RANDOMPICS=$(echo "$SELECTED_ENTRY" | awk -F: '{print $2}')

# Debug: Print the selected wallpaper filename
echo "Selected wallpaper: $RANDOMPICS"
TEMP_FILE=$(mktemp)

# Generate a list of wallpapers with image previews only
WALLPAPER_LIST=$(ls "$DIR" | while read -r file; do
  echo "img:$DIR/$file"
done)

# Set the selected wallpaper
if [ -n "$RANDOMPICS" ]; then

  swww query || swww init

  echo Setting ${RANDOMPICS}

  wal -i "${RANDOMPICS}" -n

  sleep 0.7s

  swww img ${RANDOMPICS} --transition-fps 60 --transition-type grow --transition-pos 0,1600 --transition-duration 3

  pywalfox update

  cp ~/.cache/wal/cava.colors ~/.config/cava/config && cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css && cp ~/.cache/wal/colors-waybar.css ~/.config/wlogout/colors-waybar.css && cp ~/.cache/wal/colors-waybar.css ~/.config/hyprsw/colors-waybar.css

  killall hyprswitch && hyprswitch init --custom-css ~/.config/hyprsw/hyprsw.css

  pywal-discord -p ~/.config/vesktop/themes -t pywal-discord

  if pgrep -x "hyprswitch" >/dev/null; then
    pkill -x "hyprswitch"
  else
    hyprswitch init --custom-css ~/.config/hyprsw/hyprsw.css &
  fi
fi
