#!/bin/sh
set -e
mkdir -p /config
if [ ! "$(ls -A /config)" ]; then
  cp -rf /config-example/* /config
  exit 0
fi
sh /roa.sh
if [ ! -f /config/ptp.conf ]; then
  sh /ptp.sh | tee /config/ptp.conf
fi
/init
