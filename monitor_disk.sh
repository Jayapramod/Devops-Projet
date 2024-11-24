#!/bin/bash
# File: monitor_disk.sh

DISK_THRESHOLD=80
EMAIL="jayapramodmanikantan@gmail.com"

# Get the disk usage of root directory
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Current Disk Usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "Disk usage critical. Please take necessary action!" | mail -s "Disk Utilization Alert" "$EMAIL"
    echo "Alert sent to $EMAIL"
else
    echo "Disk usage is within limits."
fi
