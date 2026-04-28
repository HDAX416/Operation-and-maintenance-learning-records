#!/bin/bash
DATE=$(date "+%Y-%m-%d %H:%M:%S")
LOG="./sys_monitor.log"

# ========== 1. CPU使用率 ==========
CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# ========== 2. 内存使用 ==========
MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# ========== 3. 磁盘使用率 / ==========
DISK=$(df -P / | grep -v Filesystem | awk '{print $5}' | sed 's/%//g')

# ========== 输出信息 ==========
echo "===== [$DATE] 系统监控 =====" | tee -a $LOG
echo "CPU 使用率: ${CPU}%" | tee -a $LOG
echo "内存使用率: ${MEM}%" | tee -a $LOG
echo "根目录磁盘: ${DISK}%" | tee -a $LOG

# ========== 阈值告警 ==========
if (( $(echo "$CPU > 85" | bc -l) )); then
  echo "【告警】CPU 占用过高！" | tee -a $LOG
fi

if (( $(echo "$MEM > 90" | bc -l) )); then
  echo "【告警】内存占用过高！" | tee -a $LOG
fi

if [ $DISK -gt 85 ]; then
  echo "【告警】磁盘空间即将不足！" | tee -a $LOG
fi

# ========== 核心服务端口检查 ==========
echo -e "\n----- 服务端口检测 -----" | tee -a $LOG
ss -tulnp | grep -E "3306|6379"
