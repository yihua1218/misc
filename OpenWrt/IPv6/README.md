# OpenWrt IPv6

原本是想在 OpenWrt 用 OpenVPN 路由 LAN 的 IPv6 到 OpenVPN Server，可是目前 OpenWrt 上的 OpenVPN package 不支援 iroute-ipv6 選項，所以無法 LAN 的 IPv6 經由 OpenVPN 路由。所以只好採用另一個方法，OpenVPN tunnel 建立後，以 IPv6 in IPv4 的方式，將 OpenWrt LAN 的 IPv6 封包，經由 IPv6 in IPv4 的 tunnel 再經由 OpenVPN 建立的 IPv4 tunnel 串到支援 IPv6 的主機上。

## Script

腳本 ipv6 用於設定 OpenWrt 至 Tunnel Server 之間的 IPv6 in IPv6 Tunnel，設定檔儲存於 /etc/ipv6.conf 內：

``` bash
SERVER=<remote_ipv6_address>
CLIENT=<local_ipv6_address>
CLIENT_SUBNET<local_ipv6_subnet>
ROUTE_DEV=tun0
TUNNEL_DEV=ip6ip6
TUNNEL_IPV6=<tunnel_ipv6_address>
```

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

## Step by Step

從剛把 WiTi 升級成 OpenWRT 17.01.4 並且 Factory Reset 後，到 LAN 都透過 IPv6inIPv6 Tunnel 連上 IPv6 網路的每一個步驟。

1. 設定 Root Password
2. 設定 WAN 連線：[Smartphone USB Tethering to an OpenWrt router](https://openwrt.org/docs/guide-user/network/wan/smartphone.usb.tethering)，連 iPhone 7 Plus 沒有成功。
3. 設定 OpenVPN Client：[OpenVPN Client](https://openwrt.org/docs/guide-user/services/vpn/openvpn/client)
4. 建立 IPv6inIPv6 Tunnel：[IPv6 Essentials](https://openwrt.org/docs/guide-user/network/ipv6/ipv6.essentials)

## Mac OS IPv6 under OpenWrt

Works when connected to the OepnWrt IPv6 Wi-Fi network, but after few minutes. IPv6 conneciton fail.

``` bash
Internet6:
Destination                             Gateway                         Flags         Netif Expire
default                                 fe80::44ba:5cff:fe8c:b2f4%en0   UGc             en0
default                                 fe80::%utun0                    UGcI          utun0
::1                                     ::1                             UHL             lo0
2001:470:8a1c:8401::df9                 f4:5c:89:a8:4d:d3               UHL             lo0
fe80::%lo0/64                           fe80::1%lo0                     UcI             lo0
```

After few minutes, default route to the internet dissapear.

``` bash
Internet6:
Destination                             Gateway                         Flags         Netif Expire
default                                 fe80::%utun0                    UGcI          utun0
default                                 fe80::%utun1                    UGcI          utun1
```

Monitor the routing state:

``` bash
$ nettop -m route
default -> en0 -> fe80::44ba:5cff:fe8c:b2f4%en0                                         2054 KiB         511 KiB    10 KiB   387 KiB    46 KiB        23        21 234.12 ms
  google-public-dns-a.google.com                                                           0 B             0 B       0 B       0 B       0 B           0         0   0.00 ms
  dns.hinet.net

```

Recovery by ipconfig command:

``` bash
$ sudo ipconfig set en0 automatic-v6
$ sudo ipconfig set en5 automatic-v6
```

### Related Discussions

1. [Losing IPv6 default route](https://discussions.apple.com/thread/6622734)
2. [Multiple unused utun interfaces after macOS upgrade](https://github.com/Tunnelblick/Tunnelblick/issues/340)

## Reference

1. [Configuring IPv6-in-IPv4 tunnels](http://mirrors.deepspace6.net/Linux+IPv6-HOWTO/chapter-configuring-ipv6-in-ipv4-tunnels.html)