#!/bin/bash

# Extract the installation timestamp from the pacman log
install_timestamp=$(awk -F "[[ ]" 'NR==1 {print $2}' /var/log/pacman.log | sed 's/]$//')

# Check if the timestamp was successfully extracted
if [[ -z "$install_timestamp" ]]; then
  echo "Error: Could not extract the installation timestamp from /var/log/pacman.log"
  exit 1
fi

# Convert the timestamp to a formatted date
formatted_date=$(date -d "$install_timestamp" "+%B %d, %Y" 2>/dev/null)
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to parse the installation timestamp"
  exit 1
fi

# Convert the day to an ordinal (e.g., 1 -> 1st, 2 -> 2nd)
ordinal_day=$(date -d "$install_timestamp" "+%d" | sed 's/^0*//')
case $ordinal_day in
1 | 21 | 31) suffix="st" ;;
2 | 22) suffix="nd" ;;
3 | 23) suffix="rd" ;;
*) suffix="th" ;;
esac

# Format the final output
final_date=$(date -d "$install_timestamp" "+%B")" $ordinal_day$suffix, "$(date -d "$install_timestamp" "+%Y")

# Output the result
echo " $final_date"
