#!/bin/sh
case "$1" in
pre) modprobe -r ucsi_acpi ;;
post) modprobe ucsi_acpi & ;;
esac
