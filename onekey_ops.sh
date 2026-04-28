#!/bin/bash

# 颜色定义
GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
RES="\033[0m"

echo -e "${GREEN}=====================================${RES}"
echo -e "${GREEN}  一键运维控制台（Docker+MySQL+Redis）${RES}"
echo -e "${GREEN}=====================================${RES}"
echo "1. 启动所有服务"
echo "2. 停止所有服务"
echo "3. 查看服务状态"
echo "4. 备份MySQL数据库"
echo "5. 健康检查（MySQL+Redis）"
echo "0. 退出"
echo -n "请输入选项："

read num

case $num in
1)
    echo -e "${YELLOW}正在启动所有服务...${RES}"
    docker start my-mysql
    docker start my-redis
    docker start my-nginx-app
    echo -e "${GREEN}启动完成！${RES}"
    ;;

2)
    echo -e "${YELLOW}正在停止所有服务...${RES}"
    docker stop my-mysql
    docker stop my-redis
    docker stop my-nginx-app
    echo -e "${GREEN}停止完成！${RES}"
    ;;

3)
    echo -e "${YELLOW}当前服务状态：${RES}"
    docker ps --filter "name=my-"
    ;;

4)
    echo -e "${YELLOW}开始备份MySQL...${RES}"
    ./mysql_backup.sh
    ;;

5)
    echo -e "${YELLOW}开始健康检查...${RES}"
    ./mysql_health.sh
    ./redis_health.sh
    ;;

0)
    exit 0
    ;;

*)
    echo -e "${RED}输入错误！${RES}"
    ;;
esac
