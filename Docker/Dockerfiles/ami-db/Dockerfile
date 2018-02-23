FROM yihua1218/ami-grunt:latest
RUN yum -y install git java wget make gcc vim telnet
RUN yum -y install https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-6-x86_64/pgdg-ami201503-94-9.4-3.noarch.rpm
RUN yum -y install postgresql94 postgresql94-server
RUN cat /dev/null > /etc/sysconfig/network
RUN service postgresql94 initdb
COPY pg_hba.conf /var/lib/pgsql94/data
RUN chown postgres:postgres /var/lib/pgsql94/data/pg_hba.conf
ADD dynamodb_local_latest.tar.gz /root/dynamodb
RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar xvzf redis-stable.tar.gz
RUN cd redis-stable && make
RUN yum -y install mysql-server
RUN yum -y install openssh-server