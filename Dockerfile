FROM redis:7-alpine

# EasyPanel-friendly Redis image with explicit config and startup checks.
COPY redis.conf /usr/local/etc/redis/redis.conf
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 6379
VOLUME ["/data"]

HEALTHCHECK --interval=30s --timeout=5s --start-period=15s --retries=5 \
  CMD sh -c 'redis-cli -h 127.0.0.1 -p "${REDIS_PORT:-6379}" -a "$REDIS_PASSWORD" ping | grep -q PONG'

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
