#！/bin/bash
echo "开始筛选日志中的错误"
grep "error" /var/log/syslog > ~/ops_study/error_log.txt
echo "筛选完成，结果保存在error_log.txt"


