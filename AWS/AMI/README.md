# Amazon Machine Images

使用 Amazon Machine Images 做為開發環境的原因是為了要確保所開發的應用程式，往後能夠順利地在 AWS 的 Lambda 或 EC2 環境上執行，而不會有其他環境因素造成應用程式無法正常運行。

## Install and Setup SSH Server

Install openssh-server package via yum command:

``` bash
# yum install -y openssh-server
```

Modified /etc/ssh/sshd_config for allowing root login:

``` conf
PermitRootLogin yes
#PermitRootLogin forced-commands-only
PubkeyAuthentication yes
```

Startup SSH Server

``` bash
# /etc/init.d/sshd start
```
