#!/bin/bash

RYZENADJ="/usr/bin/ryzenadj"
NOTIFY_SEND="/usr/bin/notify-send"
STATE_FILE="/tmp/ryzenadj_state"
LIMITS=(10000 73000)
MODES=("power-saving" "max-performance")

# Read last index or start at -1
if [[ -f "$STATE_FILE" ]]; then
  last_index=$(cat "$STATE_FILE")
else
  last_index=-1
fi

# Calculate next index
next_index=$(((last_index + 1) % 2))
new_limit=${LIMITS[$next_index]}
new_mode=${MODES[$next_index]}

# Run RyzenAdj with the new settings
sudo ryzenadj --stapm-limit=$new_limit --fast-limit=$new_limit --slow-limit=$new_limit --$new_mode

# Save the new index
echo $next_index >"$STATE_FILE"

# Show notification
"$NOTIFY_SEND" "Power state: $((new_limit / 1000)) Watts ($new_mode)"
