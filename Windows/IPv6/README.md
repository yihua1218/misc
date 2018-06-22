# IPv6 on Windows

在家裡使用 IPv6 連線到 AWS 的 EC2 主機，可能需要調整 MTU。

``` cmd
> netsh interface ipv6 show subinterfaces
> netsh interface ipv6 set subinterface "Wi-Fi" mtu=1346 store=persistent
```