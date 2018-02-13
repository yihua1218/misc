FROM yihua1218/ami-grunt:latest
RUN yum -y install git postgresql postgresql-server postgresql-contrib
RUN cat /dev/null > /etc/sysconfig/network
RUN service postgresql initdb
