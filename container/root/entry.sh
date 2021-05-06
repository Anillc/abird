#!/bin/sh
set -e
mkdir -p /abird
if [ ! "$(ls -A /abird)" ]; then
  cp -rf /abird-example /abird
  exit 0
fi
/roa.sh
/init
