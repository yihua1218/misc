# IPv6 on Windows

建立在 Windows 上的 IPv6 測試環境。

## 測試 IPv6

``` cmd
> ping -6 dns.hinet.net
```

``` cmd
> netstat -rn
```

## MTU

在家裡使用 IPv6 連線到 AWS 的 EC2 主機，可能需要調整 MTU。

``` cmd
> netsh interface ipv6 show subinterfaces
> netsh interface ipv6 set subinterface "Wi-Fi" mtu=1346 store=persistent
```

IPv4 似乎也需要設定 MTU

``` cmd
> ping aws.hoebus.idv.tw -l 1554
> netsh interface ipv4 set subinterface "Wi-Fi" mtu=1554 store=persistent
```

其實我以為 MTU 會自動調整？

## IPv4 優先於 IPv6

``` cmd
> netsh interface ipv6 show prefixpolicies
>  netsh interface ipv6 set prefixpolicy ::ffff:0:0/96 60 4
```

### Reference

1. [使用 IPv6 DualStack 連線速度變慢](http://blog.xuite.net/tolarku/blog/308631877-%E4%BD%BF%E7%94%A8+IPv6+DualStack+%E9%80%A3%E7%B7%9A%E9%80%9F%E5%BA%A6%E8%AE%8A%E6%85%A2)