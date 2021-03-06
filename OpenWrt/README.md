# Notes about OpenWrt

## [HAProxy](http://www.haproxy.org)

Setup HAProxy for redirect OpenWrt Web Admin and Web Servers in the LAN side.

### CORS Access Using HAProxy for Front End Development

使用 HAProxy 來為 HTTP Response 加上 Header 來進行 CORS。

``` conf
global
  tune.ssl.default-dh-param 2048

defaults
  timeout http-request    10s
  timeout queue           1m
  timeout connect         10s
  timeout client          1m
  timeout server          1m
  timeout http-keep-alive 10s
  timeout check           10s  


frontend frontend_http
  mode http
  bind *:80
  
  rspadd Access-Control-Allow-Origin:\ *
  rspadd Access-Control-Allow-Methods:\ GET,\ HEAD,\ OPTIONS,\ POST,\ PUT
  rspadd Access-Control-Allow-Credentials:\ true
  rspadd Access-Control-Allow-Headers:\ Origin,\ Accept,\ X-Requested-With,\ Content-Type,\ Access-Control-Request-Method,\ Access-Control-Request-Headers,\ Authorization,\ If-Modified-Since

  acl host_api  hdr(host) -i api.localhost

  use_backend backend_api if host_api

backend backend_api
  mode http
  server server_api api.server.net:443 check ssl verify none

```

## Tor

``` bash
# opkg update
# opkg install tor tor-geoip
```

1. [OpenWrt Tor proxy and anonymizing middlebox setup](https://www.pcsuggest.com/openwrt-tor-proxy-setup/)
2. [Configuring Onion Services for Tor](https://www.torproject.org/docs/tor-onion-service)