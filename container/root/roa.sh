#!/bin/sh
set -e
wget -O /etc/bird/roa_dn42_v6.conf https://dn42.burble.com/roa/dn42_roa_bird2_6.conf
wget -O /etc/bird/roa_dn42.conf https://dn42.burble.com/roa/dn42_roa_bird2_4.conf