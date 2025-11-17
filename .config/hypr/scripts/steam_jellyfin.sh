#!/bin/bash

export QT_QPA_PLATFORM=xcb
gamescope -f -W 1920 -H 1080 --backend wayland -- /usr/bin/jellyfinmediaplayer --fullscreen
