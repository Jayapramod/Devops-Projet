#!/bin/bash

disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
echo "Current disk usage: ${disk_usage}%"  # Debug line

if [ $disk_usage -ge 80 ]; then
    echo "Disk usage is critically high: ${disk_usage}% on $(hostname)" | mail -s "Disk Utilization Alert - ${disk_usage}%" jayapramodmanikantan@gmail.com
    echo "Email alert sent successfully"  # Debug line
else
    echo "Disk usage is under control: ${disk_usage}%"
fi
