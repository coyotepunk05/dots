#!/usr/bin/env bash
sleep 20s
sudo reflector --latest 5 --country "United States" --sort rate --save /etc/pacman.d/mirrorlist --protocol https --download-timeout 15
