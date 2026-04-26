# 🛠 Operation and Maintenance Learning Records (运维学习笔记)

本项目用于记录我在大二期间学习 **Cloud Native (云原生)**、**DevOps** 以及 **网络工程** 相关的实践过程与心得。

---

## 📂 目录结构
* `Linux/`: 常用命令、Shell 脚本自动化实践。
* `Docker/`: 容器化部署、Dockerfile 编写技巧。
* `Network/`: OSPF/BGP 协议实验、思科/华为设备配置笔记。
* `Java_Backend/`: 基于 Spring Boot 的后端开发练习。

## 🚀 核心实验记录
### 1. 校园社团管理系统
- **技术栈**: Java, MySQL, Spring Boot
- **核心点**: 实现了三级权限控制（管理员/社团负责人/成员），练习了后端业务逻辑开发。

### 2. Docker 环境搭建与优化
- **实践**: 解决了 WSL 镜像源加速、Dockerfile 权限报错（如 `usr` 路径纠错）等问题。

## 🛠 开发环境
- **OS**: Windows 11 (WSL2 - Ubuntu)
- **RAM**: 16GB
- **IDE**: VS Code / IntelliJ IDEA

## ✍️ 最近更新
- [2026-04-23] 成功配置 SSH 443 端口隧道，解决 GitHub 提交连接拒绝问题。
- [2026-04-20] 完成 Docker 网络配置实验。

---
> **Learning by doing.** 。
```bash
# Docker 容器的命令
docker pull nginx
docker run -d --name my-web -p 8080:80 -v $(pwd):/usr/share/nginx/html nginx start my-web
docker stop my-web
docker rm -f my-web
docker exec -it my-nginx bash
docker ps -a
docker logs my-web

#Dockerfile 文件编写
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

#构建镜像
docker build -t my-nginx:v1 .
docker images
#运行镜像
docker run -d --name my-nginx-app -p 8081:80 my-nginx:v1
#测试访问
curl http://localhost:8081

#Docker-Compose使用
docker-compose up -d

#SEHLL脚本的使用
#MySQL
#启动容器
docker run -d 
  --name my-mysql 
  -p 3306:3306 
  -e MYSQL_ROOT_PASSWORD=123456 
  -v mysql_data:/var/lib/mysql 
  mysql:8.0
#进入容器内部
docker exec -it my-mysql mysql -uroot -p123456
#困了先歇一会吧
```
现在是4.26.其实之前已经写过一部分。但昨晚和我女朋友讲解时发现好多都已经忘记了，所以今天做一个全面的复习，要求能够全部自己写出来，还要记录下所有报错。
