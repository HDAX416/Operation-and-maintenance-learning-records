#!/bin/bash


echo"日志清理脚本"
DATE=$(date+%Y-%m%d)
LOG_DIR="/var/log"


echo"当前时间：$DATE"
echo"日志目录: $LOG_DIR"

# 查找2天前的log文件并压缩
find $LOG_DIR -name "*.log" -type f -mtime +7 -exec gzip{} \;
echo "清理完成"
