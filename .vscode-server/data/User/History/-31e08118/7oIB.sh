#!/bin/sh

LAST_ACCESS="$(stat -c'%X' /var/log/wtmp)"
CURRENT_TIME="$(date +%s)"
DIFF="$((CURRENT_TIME-LAST_ACCESS))"


# 36000 meaning 10 hours in seconds
if [ $DIFF -ge 36000 ];then
  echo $DIFF
  sudo shutdown -h now
fi

# If still logged in, we exit
if last | grep "still logged in";then
  exit 0
fi

# 7200 meaning 2 hours in seconds
if [ $DIFF -ge 7200 ];then
  sudo shutdown -h now
fi

if sudo netstat -tnpa | grep 'ESTABLISHED.*ssh' > /dev/null; then
  echo "SSH connection in progress"
else
  echo "No SSH connection in progress"
  sudo shutdown -h now
fi