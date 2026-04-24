#!/bin/bash

# 配置（等号两边绝对不能有空格！）
USER="root"
PASS="123456"
DATABASE="testdb"
BACKUP_DIR="./mysql_backups"
DATE=$(date +%Y%m%d_%H%M%S)

# 创建目录
mkdir -p $BACKUP_DIR

# 备份（变量用 $ 引用）
docker exec my-mysql mysqldump -u$USER -p$PASS $DATABASE > $BACKUP_DIR/${DATABASE}_${DATE}.sql

# 压缩
gzip $BACKUP_DIR/${DATABASE}_${DATE}.sql

# 删除7天前备份
find $BACKUP_DIR -name "*.sql.gz" -mtime +7 -delete

echo "备份完成：$BACKUP_DIR/${DATABASE}_${DATE}.sql.gz"

