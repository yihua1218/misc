#!/bin/bash

#IPV6_ROUTES=`ip -6 route | grep 2001: | awk '{ print $1 }' | awk 'BEGIN { FS = "::" } { print $1 }'`
IPV6_ROUTES=`ip -6 route | grep 2001: | awk '{ print $1 }'`
CURRENT_IPv6_SUBNETS=`ip -6 addr | grep 2001: | awk '{ print $2 }' | awk 'BEGIN { FS = "::" } { print $1 }'`

echo current ipv6 subnets: $CURRENT_IPv6_SUBNETS
for ipv6_route in $IPV6_ROUTES; do
  ipv6_route_prefix=`echo $ipv6_route | awk 'BEGIN { FS = "::" } { print $1 }'`
  MATCHED=0
  for current_ipv6_subnet in $CURRENT_IPv6_SUBNETS; do
    if [ "$ipv6_route_prefix" == "$current_ipv6_subnet" ]; then
      MATCHED=1
    fi
  done
  if [ $MATCHED -ne 1 ] ; then
    echo $ipv6_route is old routing
    sudo ip route delete $ipv6_route
  fi
done
