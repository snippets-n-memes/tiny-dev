#!/bin/bash

if [[ ! $(getent passwd 1000) ]]; then
  useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 $DEV_USER 
  echo "$DEV_USER:$DEV_PASSWD" | chpasswd
else
  echo "user exists"
fi

/usr/sbin/sshd -D