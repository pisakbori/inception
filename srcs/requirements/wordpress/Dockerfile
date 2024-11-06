FROM alpine:3.19

COPY tools/start.sh .

RUN apk update && \
    apk upgrade && \
    apk add vim && \
    apk add php php-fpm php82-session php82-iconv&& \
    apk add php-mysqli  && \
    apk add curl  && \
    apk add php82-cli php82-phar  && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    chmod +x start.sh && \
    adduser -D -G www-data www-data &&\
    mkdir -p /var/www/html &&\
    chown -R www-data:www-data /var/www/html/ &&\
    chown -R www-data:www-data /var/log/php82

USER www-data

COPY /conf/www.conf /etc/php82/php-fpm.d/www.conf

ENTRYPOINT ["./start.sh"]

EXPOSE	9000


