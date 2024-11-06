FROM alpine:3.19

ARG REDIS_PASS
ENV REDIS_PASS=${REDIS_PASS}

RUN apk update && \
    apk upgrade && \
    apk add redis  && \
    chown -R redis:www-data /var/lib/redis  && \
    chown -R redis:www-data /etc/redis.conf 
# echo "maxmemory 256mb" >> /etc/redis.conf && \
# echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf && \
# echo "bind 0.0.0.0" >> /etc/redis.conf
# sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis.conf
# requirepass ${REDIS_PASS}

USER redis

CMD ["sh", "-c", "redis-server --daemonize no --maxmemory 256mb --maxmemory-policy allkeys-lru --bind 0.0.0.0 --requirepass ${REDIS_PASS}"]
