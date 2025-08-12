#!/bin/sh

LAST_ACCESS="$(stat -c'%X' /var/log/wtmp)"
CURRENT_TIME="$(date +%s)"
DIFF="$((CURRENT_TIME-LAST_ACCESS))"

# If still logged in, we exit
if last | grep "still logged in";then
  exit 0
fi

if sudo netstat -tnpa | grep 'ESTABLISHED.*ssh' > /dev/null; then
  echo "SSH connection in progress"
else
  echo "No SSH connection in progress"
  sudo shutdown -h now
fi