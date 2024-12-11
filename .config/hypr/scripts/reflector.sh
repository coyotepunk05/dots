#!/usr/bin/env bash
sleep 20s
reflector --verbose -l 200 -n 20 -p http --sort rate --save /etc/pacman.d/mirrorlist
