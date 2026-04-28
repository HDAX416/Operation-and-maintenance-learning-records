# 基础镜像：用官方Nginx精简版
FROM nginx:alpine

# 作者信息（可选，简历加分）
LABEL maintainer="hu <your_email@xxx.com>"

# 将本地的index.html复制到容器的Nginx默认目录
COPY index.html /usr/share/nginx/html/index.html

# 暴露80端口
EXPOSE 80

# 容器启动时运行Nginx
CMD ["nginx", "-g", "daemon off;"]
