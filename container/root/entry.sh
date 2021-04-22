#!/usr/bin/bash
if [ ! "$(ls -A /bird)" ]; then
  cp /init.conf /bird/abird.conf
  mkdir /bird/dn42peers
  mkdir /bird/internetpeers
  mkdir /bird/intranetpeers
  exit 0
fi
mkdir -p /run/bird
touch /run/bird/bird.ctl
bird -f
