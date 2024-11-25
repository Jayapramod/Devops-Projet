#!/bin/bash

# Get the disk usage percentage for the root directory
disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if the disk usage is greater than or equal to the threshold set in Jenkins
if [ $disk_usage -ge $DISK_THRESHOLD ]; then
    # Send an email if the disk usage is above the threshold
    echo "Disk usage is critically high: ${disk_usage}% on $(hostname)" | mail -s "Disk Utilization Alert - ${disk_usage}%" $ALERT_EMAIL
fi
