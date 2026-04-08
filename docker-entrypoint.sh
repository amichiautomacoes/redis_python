#!/bin/sh
set -eu

if [ -z "${REDIS_PASSWORD:-}" ]; then
  echo "ERROR: REDIS_PASSWORD is required."
  exit 1
fi

exec redis-server /usr/local/etc/redis/redis.conf \
  --bind 0.0.0.0 \
  --port "${REDIS_PORT:-6379}" \
  --appendonly "${REDIS_APPENDONLY:-yes}" \
  --save "${REDIS_SAVE:-900 1 300 10 60 10000}" \
  --maxmemory "${REDIS_MAXMEMORY:-0}" \
  --maxmemory-policy "${REDIS_MAXMEMORY_POLICY:-noeviction}" \
  --requirepass "${REDIS_PASSWORD}"
