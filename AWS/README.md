# AWS

## HAProxy

在沒有 Public IPv4 Address 的 LAN 底下的機器的網頁，DNS A Record 綁 VPN Server 的 IPv4 Address，再經由 HAProxy，轉向 IPv6 Address 來進行存取。