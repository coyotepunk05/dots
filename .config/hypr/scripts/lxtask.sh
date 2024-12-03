#!/usr/bin/env bash
if pgrep -x "missioncenter" >/dev/null; then
  pkill -x "missioncenter"
else
  export GTK_THEME=Adwaita-dark && missioncenter &
fi
