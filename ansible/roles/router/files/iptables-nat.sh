#! /usr/bin/env sh
iptables -t nat -A POSTROUTING -o ens4 -s 172.20.100.0/24 -j MASQUERADE