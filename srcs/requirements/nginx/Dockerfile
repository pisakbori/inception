FROM alpine:3.19

RUN adduser -D nginx

USER root

RUN apk update && \
    apk upgrade && \
    apk add nginx php php-fpm && \
    apk add vim && \
    apk add curl && \
    apk add openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42/OU=42/CN=login.42.de/UID=login"&& \
    chown -R nginx:nginx /etc/nginx/ssl && \
    # Only nginx has read and write permissions
    chmod 600 /etc/nginx/ssl/inception.key && \
    # Read permissions to all users, write permission to nginx only.
    chmod 644 /etc/nginx/ssl/inception.crt && \
    # Only accessible by nginx
    chmod 700 /etc/nginx/ssl

USER nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/fastcgi-php.conf /etc/nginx/fastcgi-php.conf
COPY conf/mime.types /etc/nginx/mime.types

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]