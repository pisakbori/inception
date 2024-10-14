FROM alpine:3.19

COPY conf/my.cnf /etc/my.cnf
COPY tools/start.sh .

RUN apk update && \
    apk upgrade && \
    apk add vim && \
    chmod +x start.sh   && \
    apk add mariadb mariadb-client


ENV SQL_DATABASE=dbname
ENV SQL_USER=mysql2
ENV SQL_PASSWORD=bla
ENV SQL_ROOT_PASSWORD=blaa

EXPOSE	3306

ENTRYPOINT ["./start.sh"]
# ENTRYPOINT ["sh"]


