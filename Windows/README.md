# Develop Environment on Windows

For developer who wants to develop Linux based software projects on the Windows, especially for myself.

## Install Softwares

1. [Cygwin](http://cygwin.com/install.html)

## Setup Environment



## Setup node-gyp

For install node-gyp, must install the windows-build-tools by using Administartor privilege. Run powershell as Administrator and use the following commands to install windows-build-tools and node-gyp

``` bash
# npm install --global --production windows-build-tools
$ npm install --global node-gyp
```

## Practice: build haproxy for Windows

本來再次安裝使用 Cygwin 是為了在 Windows 上編譯 haproxy 來使用的，不過後來在 github 上找到了別人編譯好的 haproxy for Windows，就先直接使用。改天放假有空時，再來自己超做一次。([haproxy for Windows](https://github.com/letssudormrf/haproxy-windows), [letssudormrf](https://github.com/letssudormrf))