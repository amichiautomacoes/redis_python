FROM redis:7-alpine

# EasyPanel-friendly Redis image:
# - AOF enabled
# - password configurable via REDIS_PASSWORD
# - port configurable via REDIS_PORT
EXPOSE 6379

CMD ["sh", "-c", "redis-server --appendonly yes --bind 0.0.0.0 --port ${REDIS_PORT:-6379} --requirepass \"${REDIS_PASSWORD:-Redis@123}\""]
