# OpenWrt IPv6

原本是想在 OpenWrt 用 OpenVPN 路由 LAN 的 IPv6 到 OpenVPN Server，可是目前 OpenWrt 上的 OpenVPN package 不支援 iroute-ipv6 選項，所以無法 LAN 的 IPv6 經由 OpenVPN 路由。所以只好採用另一個方法，OpenVPN tunnel 建立後，以 IPv6 in IPv4 的方式，將 OpenWrt LAN 的 IPv6 封包，經由 IPv6 in IPv4 的 tunnel 再經由 OpenVPN 建立的 IPv4 tunnel 串到支援 IPv6 的主機上。

[Configuring IPv6-in-IPv4 tunnels](http://mirrors.deepspace6.net/Linux+IPv6-HOWTO/chapter-configuring-ipv6-in-ipv4-tunnels.html)