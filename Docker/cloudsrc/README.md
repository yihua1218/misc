# Docker for developing Nuclias

## Ubuntu for buiding device agent

``` bash
$ docker run \
  --name ubuntu \
  -v $HOME:/root \
  -it ubuntu bash
$ apt-get update
$ apt-get install gcc g++ gdb make valgrind git cmake autoconf libssl-dev zlib1g-dev libtool-bin
```

## Todo

1. 想要在同一台機器上，跑兩組服務的話，怎麼寫 docker-compose.yml 比較好？
