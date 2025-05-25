#!/usr/bin/env bash

# Flags:
# r: region
# s: screen
# c: clipboard
# f: file
# i: interactive
# p: pixel

capture_region() {
  # Start hyprpicker to freeze screen
  hyprpicker -r -v >/dev/null &
  picker_pid=$!

  # Ensure it's cleaned up on exit
  trap "kill $picker_pid 2>/dev/null; wait $picker_pid 2>/dev/null" EXIT

  sleep 0.1 # Give time for freeze to appear

  # Capture region
  region=$(slurp -b '#000000b0' -c '#00000000')
  slurp_status=$?

  # Exit trap will clean up picker
  [[ $slurp_status -ne 0 ]] && exit 1
  echo "$region"
}

timestamped_filename() {
  mkdir -p ~/Pictures/Screenshots
  echo ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
}

if [[ $1 == rc ]]; then
  region=$(capture_region) || exit 1
  grim -g "$region" - | wl-copy
  notify-send 'Copied to Clipboard' Screenshot

elif [[ $1 == rf ]]; then
  region=$(capture_region) || exit 1
  filename=$(timestamped_filename)
  grim -g "$region" "$filename"
  wl-copy <"$filename"
  notify-send 'Screenshot Taken, Copied To Clipboard' "$filename"

elif [[ $1 == ri ]]; then
  region=$(capture_region) || exit 1
  grim -g "$region" - | swappy -f -

elif [[ $1 == sc ]]; then
  grim - | wl-copy
  notify-send 'Copied to Clipboard' Screenshot

elif [[ $1 == sf ]]; then
  filename=$(timestamped_filename)
  grim "$filename"
  notify-send 'Screenshot Taken' "$filename"

elif [[ $1 == si ]]; then
  grim - | swappy -f -

elif [[ $1 == p ]]; then
  color=$(hyprpicker -a)
  [[ $? -ne 0 ]] && exit 1
  wl-copy "$color"
  notify-send 'Copied to Clipboard' "$color"
fi
