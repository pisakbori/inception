FROM alpine:3.19

COPY conf/my.cnf /etc/my.cnf
COPY tools/start.sh .

RUN apk update && \
    apk upgrade && \
    apk add vim && \
    chmod +x start.sh   && \
    apk add mariadb mariadb-client &&\
    chown mysql:mysql /etc/my.cnf.d &&\
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql &&\
    mkdir -p /run/mysqld &&\
    chown mysql:mysql /run/mysqld

USER mysql

ENTRYPOINT ["./start.sh"]


