FROM debian:bullseye

ARG MYSQL_DATABASE \
    MYSQL_ROOT \
    MYSQL_ROOT_PASSWORD \
    MYSQL_USER \
    MYSQL_PASSWORD


RUN apt-get update && \
    apt-get install -y mariadb-server

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY /tools/create_db.sh /usr/local/bin

RUN chmod 777 -R /usr/local/bin/create_db.sh

RUN /usr/local/bin/create_db.sh

ENTRYPOINT ["mysqld_safe"]