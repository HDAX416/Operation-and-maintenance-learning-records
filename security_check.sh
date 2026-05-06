#!/bin/bash
DATE=$(date "+%Y-%m-%d %H:%M:%S")
LOG="./security.log"

echo "===== [$DATE] 服务器安全巡检 =====" >> $LOG
echo "【当前登录用户】" >> $LOG
w | head -5 >> $LOG

echo -e "\n【失败登录记录】" >> $LOG
grep -i failed /var/log/auth.log | tail -10 >> $LOG

echo -e "\n【Docker 运行容器】" >> $LOG
docker ps >> $LOG

echo -e "\n【端口监听检测】" >> $LOG
ss -tulnp >> $LOG

echo "安全巡检完成"
