#!/bin/bash
THRESHOLD=10
TO="kannangunasekaran30@gmail.com"
SUBJECT="Disk Usage Alert"

USAGE=$(df --output=pcent / | tail -n1 | tr -dc '0-9')

if ! [[ "$USAGE" =~ ^[0-9]+$ ]]; then
  echo "$(date) - ERROR parsing disk usage: USAGE='$USAGE'" >&2
  exit 1
fi

if [ "$USAGE" -ge "$THRESHOLD" ]; then
  MESSAGE="Warning: Disk usage has reached ${USAGE}% on $(hostname) at $(date -Iseconds)"
  echo "$MESSAGE" | /usr/bin/mail -s "$SUBJECT" "$TO"
fi
