#!/bin/sh

if sudo netstat -tnpa | grep 'ESTABLISHED.*ssh' > /dev/null; then
  echo "SSH connection in progress"
  s_t=$(date -d "$(uptime -s)" +%s)
  now=$(date +%s)
  u_s=$(($now - $s_t))
  u_m=$(($u_s / 60))
  
  echo $u_m

  if [ "$u_m" -ge 300 ]; then
    echo STOP
    sudo shutdown -h now
  else
    echo "Machine up since $u_m minutes"
  fi

else
  echo "No SSH connection in progress"
  sudo shutdown -h now
fi
