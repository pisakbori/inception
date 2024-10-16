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
    chmod +x start.sh 

COPY /conf/www.conf /etc/php82/php-fpm.d/www.conf

ENV WP_DATABASE=dbname
ENV WP_USER=mysql2
ENV WP_PASSWORD=bla
ENV WP_ROOT_PASSWORD=blaa
ENV WP_HOST=mariadb
ENV WP_EMAIL=borbalka@blabla.com
ENV WP_ADMIN_EMAIL=borbalka@admin.com
ENV WP_TITLE='Hello_world'
ENV WP_URL=localhost
ENV WP_ADMIN_PASSWORD=bla

ENTRYPOINT ["./start.sh"]

EXPOSE	9000


