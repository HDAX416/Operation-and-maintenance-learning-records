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
- [2026-04-20] 完成 Docker 基础网络配置实验。

---
> **Learning by doing.** 既然选择了网络工程，就从每一行配置和每一个容器开始打磨。
```bash
# 启动 Docker 容器的命令
docker run -d --name my-web -p 80:80 nginx
```
