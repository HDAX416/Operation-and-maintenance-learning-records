#!/bin/bash
LOG="./redis_health.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# 检查 Redis 是否正常响应
docker exec my-redis redis-cli PING > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "[$DATE] Redis 运行正常" | tee -a $LOG
else
    echo "[$DATE] Redis 异常，尝试重启..." | tee -a $LOG
    docker restart my-redis
    echo "[$DATE] Redis 已重启" | tee -a $LOG
fi
