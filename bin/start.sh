#!/usr/bin/env bash
baseDir=`cd $(dirname $0);pwd`
echo "Base directory: ${baseDir}"

cd ${baseDir}/..

echo "=== 开始启动工作台服务 ==="
echo "当前目录: $(pwd)"

# 创建日志目录
echo "创建日志目录..."
mkdir -p logs

echo "获取nodejs版本"
node -v

echo "npm install 开始..."
npm install --registry=http://registry.m.jd.com/
echo "npm install 完成"

echo "启动 PM2 服务..."
sudo pm2 start pm2.json

echo "=== 服务启动完成 ==="
echo "查看服务状态:"
pm2 list

echo ""
echo "=== 常用命令 ==="
echo "查看日志: pm2 logs"
echo "查看状态: pm2 list"
echo "重启服务: pm2 restart all"
echo "停止服务: ./bin/stop.sh"
