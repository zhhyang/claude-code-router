#!/usr/bin/env bash
baseDir="$(cd "$(dirname "$0")"; pwd)"

echo "Base directory: ${baseDir}"

cd ${baseDir}/..

echo "=== 停止网络代理服务 ==="
echo "当前目录: $(pwd)"

echo "停止 PM2 服务..."
pm2 stop pm2.json

echo "删除 PM2 进程..."
pm2 delete pm2.json

echo "=== 服务已停止 ==="
echo "查看当前 PM2 状态:"
pm2 list

echo ""
echo "=== 服务已完全停止 ==="
echo "如需重新启动，请运行: ./bin/start.sh"
