#!/bin/bash

#docker容器管理脚本
CONTAINER_NAME="my-nginx-app"
IMAGE_NAME="my-nginx:v1"


case $1 in
	start)
	docker rm -f $CONTAINER_NAME 2>/dev/null
	docker run -d --name $CONTAINER_NAME -p 8081:80 $IMAGE_NAME
	echo  "容器$CONTAINER_NAME启动成功"
	;;
        stop)	
	docker stop $CONTIANER_NAME
        docker rm $CONTAINER_NAME
	echo "容器$CONTAINER_NAME delete sucessful!"
	;;
        restart)
	$0 stop
	$0 start
	;;
*)
	echo "用法：$0[start|stop|restart]"
	;;
esac

