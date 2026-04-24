#!/bin/bash
LOG="./mysql_health.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# 检查 MySQL 容器是否运行
docker top my-mysql > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "[$DATE] MySQL 运行正常" | tee -a $LOG
else
    echo "[$DATE] MySQL 挂了，正在重启..." | tee -a $LOG
    docker restart my-mysql
    echo "[$DATE] 重启完成" | tee -a $LOG
fi
