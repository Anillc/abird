#!/bin/sh
{
  wget -4 -O /etc/bird/roa_dn42_v6.conf https://dn42.burble.com/roa/dn42_roa_bird2_6.conf
  wget -4 -O /etc/bird/roa_dn42.conf https://dn42.burble.com/roa/dn42_roa_bird2_4.conf
} || {
  echo > /etc/bird/roa_dn42_v6.conf
  echo > /etc/bird/roa_dn42.conf
}