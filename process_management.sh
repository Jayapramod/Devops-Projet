#!/bin/bash

# Display all running processes
echo "Listing all running processes:"
ps aux

# Search for a specific process
read -p "Enter the process name to search for: " process_name

# Find and list matching processes
matching_processes=$(pgrep -fl "$process_name")

if [[ -z "$matching_processes" ]]; then
    echo "No processes found matching '$process_name'."
else
    echo "Found the following processes:"
    echo "$matching_processes"

    # Terminate all matching processes
    pids=$(echo "$matching_processes" | awk '{print $1}')
    for pid in $pids; do
        kill -9 $pid
        echo "Terminated process with PID $pid."
    done
fi
