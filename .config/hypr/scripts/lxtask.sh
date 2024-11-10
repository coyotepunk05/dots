#!/usr/bin/env bash
if pgrep -x "lxtask" >/dev/null; then
  pkill -x "lxtask"
else
  lxtask &
fi
