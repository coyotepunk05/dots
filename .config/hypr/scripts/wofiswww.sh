#!/usr/bin/env bash

# Directory containing your wallpapers
DIR="$HOME/.config/hypr/hyprpaperssss"

# Directory for thumbnails
THUMBNAIL_DIR="$DIR/thumbnails"

# Create the thumbnail directory if it doesn't exist
mkdir -p "$THUMBNAIL_DIR"

# Generate a list of wallpapers with image previews only (thumbnails)
WALLPAPER_LIST=$(find "$DIR" -type f ! -path "$DIR/thumbnails/*" | while read -r file; do
  THUMBNAIL_PATH="$THUMBNAIL_DIR/$(basename "$file")"

  # Only resize and create the thumbnail if it doesn't already exist
  if [ ! -f "$THUMBNAIL_PATH" ]; then
    # Resize the image to a thumbnail (200x200 px) using magick
    if ! magick "$file" -resize 200x200^ "$THUMBNAIL_PATH"; then
      echo "Failed to create thumbnail for $file" >&2
      continue
    fi
  fi

  # Output the path of the thumbnail for Wofi
  echo "img:$THUMBNAIL_PATH"
done)

# Exit if no wallpapers are found
if [ -z "$WALLPAPER_LIST" ]; then
  echo "No wallpapers found." >&2
  exit 1
fi

# Use Wofi to select a wallpaper with previews
SELECTED_ENTRY=$(echo "$WALLPAPER_LIST" | wofi -c ~/.config/wofi/configswww -s ~/.config/wofi/styleswww.css --dmenu --prompt "Select Wallpaper" --allow-images --width 900 --height 900 -w 4)

# Extract the selected wallpaper filename and store it in a variable
if [ -z "$SELECTED_ENTRY" ]; then
  echo "No selection made." >&2
  exit 1
fi

RANDOMPICS=$(echo "$SELECTED_ENTRY" | awk -F: '{print $2}' | sed 's|thumbnails/||')

# Debug: Print the selected wallpaper filename
echo "Selected wallpaper: $RANDOMPICS"

# Set the selected wallpaper
if [ -n "$RANDOMPICS" ]; then
  # Initialize swww if not already running
  swww query || swww init

  # Set the wallpaper with pywal and swww
  echo "Setting wallpaper: ${RANDOMPICS}"
  wal -i "${RANDOMPICS}" -n -e
  sleep 0.7s
  swww img "${RANDOMPICS}" --transition-fps 60 --transition-type grow --transition-pos 0,1600 --transition-duration 3

  # Update browser theme
  pywalfox update || echo "pywalfox failed"

  # Add error handling for pywal-discord
  # if ! pywal-discord -p ~/.config/vesktop/themes -t default; then
  #   echo "pywal-discord failed" >&2
  #   exit 1
  # fi

  # Update Waybar, Cava, and other configs
  cp ~/.cache/wal/cava.colors ~/.config/cava/config
  cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css
  cp ~/.cache/wal/colors-waybar.css ~/.config/wlogout/colors-waybar.css
  cp ~/.cache/wal/colors-waybar.css ~/.config/hyprsw/colors-waybar.css
  # Update Starship
  sh ~/.config/hypr/scripts/starshipwal/starshipwal_contrast.sh

  # Restart Hyprswitch
  killall hyprswitch
  hyprswitch init --workspaces-per-row 4 --size-factor 4.5 --custom-css ~/.config/hyprsw/hyprsw.css &

  # Ensure Hyprswitch is running
  if ! pgrep -x "hyprswitch" >/dev/null; then
    hyprswitch init --workspaces-per-row 4 --size-factor 4.5 --custom-css ~/.config/hyprsw/hyprsw.css &
  fi
fi
