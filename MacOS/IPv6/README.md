# IPv6 on Mac OS

# 設定 MTU

``` bash
$ ping6 <ipv6_address> -s 1346
$ networksetup -setMTU en5 1346
```