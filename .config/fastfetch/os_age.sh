#!/bin/bash

# Extract the installation timestamp from the pacman log
install_timestamp=$(awk -F "[[ ]" 'NR==1 {print $2}' /var/log/pacman.log | sed 's/]$//')

# Check if the timestamp was successfully extracted
if [[ -z "$install_timestamp" ]]; then
  echo "Error: Could not extract the installation timestamp from /var/log/pacman.log"
  exit 1
fi

# Convert the timestamp to epoch seconds
install_epoch=$(date -d "$install_timestamp" +%s 2>/dev/null)
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to parse the installation timestamp"
  exit 1
fi

# Get the current time in seconds since the epoch
current_epoch=$(date +%s)

# Calculate the age in seconds
age_seconds=$((current_epoch - install_epoch))

# Calculate years, days, and hours
age_years=$((age_seconds / 31536000)) # 1 year = 31536000 seconds
remaining_seconds=$((age_seconds % 31536000))

age_months=$((remaining_seconds / 2592000)) # 1 month = 2592000 seconds
remaining_seconds=$((remaining_seconds % 2592000))

age_days=$((remaining_seconds / 86400))           # 1 day = 86400 seconds
age_hours=$(((remaining_seconds % 86400) / 3600)) # 1 hour = 3600 seconds

# Output the result, including years if applicable
output=""
if [[ $age_years -gt 0 ]]; then
  output+="$age_years Years "
fi
if [[ $age_months -gt 0 || $age_years -gt 0 ]]; then
  output+="$age_months Months "
fi
output+="$age_days Days $age_hours Hours"

echo " $output"
