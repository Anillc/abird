#!/bin/sh
set -e
mkdir -p /bird
if [ ! "$(ls -A /bird)" ]; then
  cp /abird.conf /bird/abird.conf
  mkdir /bird/dn42
  mkdir /bird/internet
  mkdir /bird/internet/peers
  mkdir /bird/internet/transits
  mkdir /bird/internet/customers
  mkdir /bird/intranet
  exit 0
fi
/roa.sh
/init
