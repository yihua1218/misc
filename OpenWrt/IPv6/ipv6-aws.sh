#!/bin/sh

. /etc/ipv6.conf

echo ip -6 route add $REMOTE dev $ROUTE_DEV
ip -6 route add $REMOTE via $GATEWAY
echo ip -6 tunnel add $TUNNEL_DEV mode ip6ip6 remote $REMOTE local $LOCAL dev $ROUTE_DEV
ip -6 tunnel add $TUNNEL_DEV mode ip6ip6 remote $REMOTE local $LOCAL
echo ip link set dev $TUNNEL_DEV up
ip link set dev $TUNNEL_DEV up
echo ip -6 route change $REMOTE_SUBNET dev $TUNNEL_DEV
ip -6 route change $REMOTE_SUBNET dev $TUNNEL_DEV
