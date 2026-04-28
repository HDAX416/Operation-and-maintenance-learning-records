#!/bin/bash

# Docker容器管理脚本
CONTAINER_NAME="my-nginx-app"
IMAGE_NAME="my-nginx:v1"

case $1 in
    start)
	#启动前自动删除同名容器
	    docker rm -f $CONTAINER_NAME 2>/dev/null
        docker run -d --name $CONTAINER_NAME -p 8081:80 $IMAGE_NAME
        echo "容器 $CONTAINER_NAME 启动成功！"
        ;;
    stop)
        docker stop $CONTAINER_NAME
        docker rm $CONTAINER_NAME
        echo "容器 $CONTAINER_NAME 停止并删除成功！"
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "用法: $0 [start|stop|restart]"
        ;;
esac
