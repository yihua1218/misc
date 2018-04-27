#!/bin/bash

. /etc/ipv6.config

ip -6 route add $SERVER dev $ROUTE_DEV
ip -6 tunnel add $TUNNEL_DEV mode ip6ip6 remote $SERVER local $CLIENT dev $ROUTE_DEV
ip link set dev $TUNNEL_DEV up
ip -6 route add default dev $TUNNEL_DEV
