# OpenWrt USB Storage

https://openwrt.org/docs/guide-user/storage/usb-drives

幫每一台安裝 OpenWrt 的 Router 的 USB 埠都接上一顆 USB 拇指隨身碟，格式化成 ext4，並裝上 CIFS 在 LAN 分享。

## Quick Install

``` bash
$ opkg update
$ opkg install kmod-usb-storage
$ opkg install usbutils
$ lsusb -t
$ opkg install fdisk
$ opkg install e2fsprogs
$ opkg install kmod-fs-ext4
$ mkfs.ext4 /dev/sda1
$ block detect > /etc/config/fstab
$ uci set fstab.@mount[0].enabled='1'
$ uci commit
$ uci set fstab.@global[0].check_fs='1'
$ uci commit
```