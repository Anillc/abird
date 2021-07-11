#!/bin/sh
set -e
mkdir -p /config
if [ ! "$(ls -A /config)" ]; then
  cp -rf /default-config/* /config
  exit 0
fi
while [ ! -f /etc/bird/ptp.conf ]; do
  /bin/sh /ptp.sh > /etc/bird/ptp.conf
done
while [ ! -f /etc/bird/dn42roa/roa_dn42.conf ]; do sleep 1; done
while [ ! -f /etc/bird/dn42roa/roa_dn42_v6.conf ]; do sleep 1; done
/init
