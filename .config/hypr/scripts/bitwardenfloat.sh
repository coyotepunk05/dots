#!/usr/bin/env bash

handle_windowtitlev2() {
  # Description: emitted when a window title changes.
  # Format: `WINDOWADDRESS,WINDOWTITLE`
  windowaddress=${1%,*}
  windowtitle=${1#*,}

  case $windowtitle in
  # Matches Firefox: "Extension: (Bitwarden Password Manager) - Bitwarden — Mozilla Firefox"
  # Matches Brave: "Bitwarden"
  *"(Bitwarden"*"Password Manager) - Bitwarden"* | "Bitwarden")
    hyprctl --batch \
      "dispatch togglefloating address:0x$windowaddress;" \
      "dispatch resizewindowpixel exact 20% 54%,address:0x$windowaddress;" \
      "dispatch centerwindow"
    ;;
  esac
}

handle() {
  # $1 Format: `EVENT>>DATA`
  event=${1%>>*}
  data=${1#*>>}

  case $event in
  windowtitlev2) handle_windowtitlev2 "$data" ;;
  *) ;; # Ignore other events
  esac
}

# Listen to Hyprland events
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
  handle "$line"
done
