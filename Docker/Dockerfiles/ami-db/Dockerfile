FROM yihua1218/ami-grunt:latest
RUN yum -y install git postgresql postgresql-server postgresql-contrib java
RUN cat /dev/null > /etc/sysconfig/network
RUN service postgresql initdb
ADD dynamodb_local_latest.tar.gz /root/dynamodb