# Develop Environment on Windows

For developer who wants to develop Linux based software projects on the Windows, especially for myself.

## Install Softwares

1. [Cygwin](http://cygwin.com/install.html), packages required: lynx
2. [apt-cyg](https://github.com/transcode-open/apt-cyg), Apt-cyg, an apt-get like tool for Cygwin

### Install packages via apt-cyg

``` bash
$ apt-cyg install wget curl
```

## Setup Environment



## Setup node-gyp

For install node-gyp, must install the windows-build-tools by using Administartor privilege. Run powershell as Administrator and use the following commands to install windows-build-tools and node-gyp

``` bash
# npm install --global --production windows-build-tools
$ npm install --global node-gyp
```

## Practice: build haproxy for Windows

Build haproxy for Windows on Cygwin, if hit the [undefined reference to `trace'](https://goo.gl/rRcee1) error, on build haproxy-1.8.7. Try make with TRACE=1 option. 

```
$ make TARGET=cygwin TRACE=1 
```

