#!/usr/bin/env bash
if pgrep -x "sherlock" >/dev/null; then
  pkill -x "sherlock"
else
  sherlock &
fi
