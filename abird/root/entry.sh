#!/bin/sh
set -e
mkdir -p /config
if [ ! "$(ls -A /config)" ]; then
  cp -rf /default-config/* /config
  exit 0
fi
/init
