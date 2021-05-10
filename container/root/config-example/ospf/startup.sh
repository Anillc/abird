#!/bin/sh
ip link add dummy2526 type dummy
ip addr add 172.22.167.97 dev dummy2526
ip addr add fdc9:83c1:d0ce::1 dev dummy2526
ip addr add 2a0e:b107:1170::1 dev dummy2526
ip link set dummy2526 up
