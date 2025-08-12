#!/bin/sh

if sudo netstat -tnpa | grep 'ESTABLISHED.*ssh' > /dev/null; then
  echo "SSH connection in progress"

  UPTIME=$(uptime | awk '{print $3}')
  echo UPTIME = $UPTIME

  hours=$(UPTIME | cut -d ':' -f 1)
  if [ -z "$hours" ]; then
    hours=0
  fi
  minutes=$(UPTIME | cut -d ':' -f 2)

  total_minutes=$(echo "$hours * 60 + $minutes" | bc)
  echo total = $total_minutes

  if [ "$total_minutes" -ge 120 ]; then
    echo STOP
  else
    echo "Machine up since $total_minutes minutes"
  fi

else
  echo "No SSH connection in progress"
  sudo shutdown -h now
fi
