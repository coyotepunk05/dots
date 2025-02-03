#!/usr/bin/env bash
if pgrep -x "wofi" >/dev/null; then
  pkill -x "wofi"
else
  wofi &
fi
