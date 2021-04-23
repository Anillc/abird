#!/usr/bin/bash
if [ ! "$(ls -A /bird)" ]; then
  cp /abird.conf /bird/abird.conf
  mkdir /bird/dn42peers
  mkdir /bird/internetpeers
  mkdir /bird/intranetpeers
  exit 0
fi
curl -sfSLR {-o,-z}/etc/bird/roa_dn42_v6.conf https://dn42.burble.com/roa/dn42_roa_bird2_6.conf
curl -sfSLR {-o,-z}/etc/bird/roa_dn42.conf https://dn42.burble.com/roa/dn42_roa_bird2_4.conf
/init
