FROM alpine:3.19

RUN apk update && \
    apk upgrade && \
    apk add nginx && \
    apk add vim && \
    apk add curl && \
    apk add openssl && \
	mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42/OU=42/CN=login.42.de/UID=login" && \
    mkdir -p /var/run/nginx && \
    chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html
    
COPY conf/nginx.conf /etc/nginx/nginx.conf