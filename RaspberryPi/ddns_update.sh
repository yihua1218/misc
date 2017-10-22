#!/bin/bash

source /etc/ddns/he.net.conf

LAST_DDNS_UPDATE_IP_FILE=/tmp/last_ddns_update_ip.log

CURRENT_IPV6_IP_ADDRESS=`ip -6 addr show dev eth0 | grep "scope global noprefixroute" | awk 'BEGIN { FS = " " } { print $2 }' | awk 'BEGIN { FS = "/" } { print $1 }' | grep 2001:`
LAST_DDNS_UPDATE_IP_ADDRESS=`cat $LAST_DDNS_UPDATE_IP_FILE`

if [ "$CURRENT_IPV6_IP_ADDRESS" == "$LAST_DDNS_UPDATE_IP_ADDRESS" ] ; then
  echo "Same LAN IPv6 IP Address: $LAST_DDNS_UPDATE_IP_ADDRESS"
else
  echo "LAN IPv6 IP Address changed, update to dns.he.net"
  curl "https://dyn.dns.he.net/nic/update?hostname=$DDNS_HOSTNAME&password=$DDNS_PASSWORD&myip=$CURRENT_IPV6_IP_ADDRESS"
  RESULT=$?
  if [ $RESULT -eq 0 ] ; then
    echo $CURRENT_IPV6_IP_ADDRESS > $LAST_DDNS_UPDATE_IP_FILE
  fi
fi

