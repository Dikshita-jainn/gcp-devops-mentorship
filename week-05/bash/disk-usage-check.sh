#!/bin/bash
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$disk_usage" -gt 80 ]
then
    echo "WARNING: Disk usage is above 80%"
else
    echo "Disk usage is normal"
fi
