#!/bin/bash

OPENVPN_SERVER_HOST="vpn.server.net"

uci set openvpn.myvpn=openvpn
uci set openvpn.myvpn.enabled='1'
uci set openvpn.myvpn.dev='tun'
uci set openvpn.myvpn.proto='udp'
uci set openvpn.myvpn.verb='3'
uci set openvpn.myvpn.client='1'
uci set openvpn.myvpn.remote_cert_tls='server'
uci set openvpn.myvpn.remote="$OPENVPN_SERVER_HOST 1194"
uci set openvpn.myvpn.route_nopull='1'
uci set openvpn.myvpn.tun_ipv6='1'
uci set openvpn.myvpn.ca='/lib/uci/upload/cbid.openvpn.ca'
uci set openvpn.myvpn.cert='/lib/uci/upload/cbid.openvpn.cert'
uci set openvpn.myvpn.key='/lib/uci/upload/cbid.openvpn.key'
uci set openvpn.myvpn.log='/var/log/openvpn-myvpn.log'
uci set openvpn.myvpn.comp_lzo='no'