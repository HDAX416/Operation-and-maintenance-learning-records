# 运维高频命令速查手册
> 整合：Linux / Docker / MySQL / Redis / Git / Crontab / 排错
> 适用：日常实操 + 面试背诵 + 快速排障

## 一、Linux 基础
### 文件目录
ls -lh                # 详细列表
cd ~                  # 回到家目录
mkdir dir             # 新建文件夹
rm -rf 文件名/目录    # 强制删除
cp 源 目标            # 复制
mv 源 目标            # 移动/重命名

### 权限执行
chmod +x xxx.sh       # 添加执行权限
chown 用户:组 文件    # 修改属主属组
sudo xxx              # 临时提权

### 系统资源
top                   # 进程CPU占用
free -h               # 内存查看
df -h                 # 磁盘使用率
uptime                # 系统负载

### 端口与网络
ss -tulnp             # 查看监听端口
ping 域名/IP          # 网络连通测试
curl 网址             # 网络访问测试

### 日志排查
tail -f 日志.log      # 实时跟踪日志
grep -i key 文件      # 关键字过滤
less 日志.log         # 分页查看大日志

## 二、Docker 容器运维
docker ps             # 运行中容器
docker ps -a          # 所有容器
docker start 容器名
docker stop 容器名
docker restart 容器名

docker exec -it 容器名 命令   # 进入容器终端
docker logs 容器名            # 查看容器日志
docker rm 容器名              # 删除容器
docker volume ls              # 数据卷查看

## 三、MySQL 容器运维
# 进入数据库
docker exec -it my-mysql mysql -uroot -p密码

# 基础SQL
SHOW DATABASES;
USE 库名;
SHOW TABLES;
SELECT * FROM 表名;

# 备份与恢复
docker exec my-mysql mysqldump -uroot -p密码 库名 > backup.sql
docker exec -i my-mysql mysql -uroot -p密码 库名 < backup.sql

## 四、Redis 缓存运维
docker exec -it my-redis redis-cli

# 基础命令
SET key value
GET key
HSET hash k v
HGETALL hash
PING                  # 健康检测

# 理论考点
5大结构：String / Hash / List / Set / ZSet
持久化：RDB(快照)、AOF(日志)
缓存问题：穿透、击穿、雪崩

## 五、Git 版本控制【重点】
git init                      # 初始化仓库
git add .                     # 暂存所有文件
git commit -m "备注"          # 本地提交
git remote -v                 # 查看远程仓库
git push                      # 推送到远程
git log --oneline             # 精简提交记录

# 版本撤回 / 恢复（重点）
git checkout .                # 撤销本地所有修改
git reset --soft HEAD^        # 撤销提交，保留代码
git reset --hard HEAD^        # 彻底回退上一版本
git reset --hard origin/master# 一键恢复远程最新（Ctrl+Y）
git push --force              # 强制推送（单人项目）

## 六、Crontab 定时任务
crontab -e        # 编辑定时
crontab -l        # 查看定时

# 语法：分 时 日 月 周 执行命令
*/10 * * * *      # 每10分钟
0 3 * * *         # 每天凌晨3点

## 七、服务器安全基础
sudo systemctl status fail2ban   # 防爆破服务状态
grep -i failed /var/log/auth.log # 筛选登录失败
chattr +i 文件                   # 锁定文件不可修改

## 八、通用排错标准流程
1. 查看服务状态：docker ps / systemctl
2. 检查端口监听：ss -tulnp
3. 检查资源：CPU、内存、磁盘
4. 过滤日志：error / warn 关键字
5. 修复配置、重启服务、恢复备份
