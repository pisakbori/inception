FROM alpine:3.19

RUN apk update && \
    apk upgrade && \
    apk add php php-fpm php82-session && \
    apk add vim && \
    apk add curl && \
    adduser -D -G www-data www-data  && \
    mkdir /run/adminer

COPY /tools/adminer-4.8.1.php /usr/share/webapps/adminer/index.php
COPY /conf/www.conf /etc/php82/php-fpm.d/www.conf

CMD ["php-fpm82", "--nodaemonize"]