# OpenWrt IPv6

原本是想在 OpenWrt 用 OpenVPN 路由 LAN 的 IPv6 到 OpenVPN Server，可是目前 OpenWrt 上的 OpenVPN package 不支援 iroute-ipv6 選項，所以無法 LAN 的 IPv6 經由 OpenVPN 路由。所以只好採用另一個方法，OpenVPN tunnel 建立後，以 IPv6 in IPv4 的方式，將 OpenWrt LAN 的 IPv6 封包，經由 IPv6 in IPv4 的 tunnel 再經由 OpenVPN 建立的 IPv4 tunnel 串到支援 IPv6 的主機上。

## OpenWrt - LAN

``` bash
# ip tunnel add sit0 mode sit ttl 0 remote 10.84.0.1 local 10.84.0.14
# ip link set dev sit0 up 
```

## Ubuntu - IPv6 Internet

``` bash
# ip tunnel add sit1 mode sit ttl 0 remote 10.84.0.14 local 10.84.0.1
# ip link set dev sit1 up
# ip -6 route add 2001:470:8a1c:8401::/64 dev sit1
```

## Reference

1. [Configuring IPv6-in-IPv4 tunnels](http://mirrors.deepspace6.net/Linux+IPv6-HOWTO/chapter-configuring-ipv6-in-ipv4-tunnels.html)