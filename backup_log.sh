#!/bin/bash
#容器日志备份脚本
LOG_DIR="./backup_log"
CONTAINER_NAME="my-nginx-app"
DATE=$(date +%Y%m%d_%H%M%S)

#创建备份目录
mkdir -p $LOG_DIR

#导出日志并压缩
docker logs $CONTAINER_NAME >$LOG_DIR/${CONTAINER_NAME}_${DATE}.log
gzip $LOG_DIR/${CONTAINER_NAME}_${DATE}.log
echo"日志备份完成：$LOG_DIR/${CONTAINER_NAME}_${DATE}.log.gz"

