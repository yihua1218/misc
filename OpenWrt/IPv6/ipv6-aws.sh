#!/bin/sh

. /etc/ipv6.conf

IP6IP6_COUNT=`ifconfig | grep ip6ip6 | wc -l`

if [ $IP6IP6_COUNT -gt 0 ]; then
    echo "IPv6 in IPv6 tunnel already exists."
    exit 0
fi

echo ip -6 route add $REMOTE dev $ROUTE_DEV
ip -6 route add $REMOTE via $GATEWAY
echo ip -6 tunnel add $TUNNEL_DEV mode ip6ip6 remote $REMOTE local $LOCAL dev $ROUTE_DEV
ip -6 tunnel add $TUNNEL_DEV mode ip6ip6 remote $REMOTE local $LOCAL
echo ip link set dev $TUNNEL_DEV up
ip link set dev $TUNNEL_DEV up
echo ip -6 route change $REMOTE_SUBNET dev $TUNNEL_DEV
ip -6 route change $REMOTE_SUBNET dev $TUNNEL_DEV
