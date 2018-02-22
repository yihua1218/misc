FROM yihua1218/ami-grunt:latest
RUN yum -y install git postgresql postgresql-server postgresql-contrib java wget make gcc
RUN cat /dev/null > /etc/sysconfig/network
RUN service postgresql initdb
ADD dynamodb_local_latest.tar.gz /root/dynamodb
RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar xvzf redis-stable.tar.gz
RUN cd redis-stable && make