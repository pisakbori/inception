FROM alpine:3.19

RUN adduser -D nginx

USER root


# Accept build-time variables
ARG DOMAIN
ARG LOGIN
ARG CERTIFICATE
ARG KEY

# Set environment variables
ENV DOMAIN=${DOMAIN}
ENV LOGIN=${LOGIN}
ENV CERTIFICATE=${CERTIFICATE}
ENV KEY=${KEY}

RUN apk update && \
    apk upgrade && \
    apk add nginx php php-fpm && \
    apk add vim && \
    apk add curl && \
    apk add openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out ${CERTIFICATE} -keyout ${KEY} -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42/OU=42/CN=${DOMAIN}/UID=${LOGIN}"&& \
    chown -R nginx:nginx /etc/nginx/

USER nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/fastcgi-php.conf /etc/nginx/fastcgi-php.conf
COPY conf/mime.types /etc/nginx/mime.types

RUN sed -i "s|\${CERTIFICATE}|$CERTIFICATE|g" /etc/nginx/nginx.conf
RUN sed -i "s|\${KEY}|$KEY|g" /etc/nginx/nginx.conf

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]