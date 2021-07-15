#!/bin/sh
set -e
mkdir -p /config
if [ ! "$(ls -A /config)" ]; then
  cp -rf /config-example/* /config
  exit 0
fi
sh /roa.sh
sh /ptp.sh > /etc/bird/ptp.conf
/init
