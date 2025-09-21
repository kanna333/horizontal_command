#!/bin/bash

# Threshold percentage
THRESHOLD=10

# Email settings
TO="kannangunasekaran30@gmail.com.com"
SUBJECT="Disk Usage Alert"

# Check disk usage of root (/) filesystem
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    MESSAGE="Warning: Disk usage has reached ${USAGE}% on $(hostname)"
    echo "$MESSAGE" | mail -s "$SUBJECT" "$TO"
fi
