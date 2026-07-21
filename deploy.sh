#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "用法: ./deploy.sh root@你的Vultr服务器IP [远程目录]"
  exit 1
fi

SERVER="$1"
REMOTE_DIR="${2:-/var/www/neo-humans}"
LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "正在上传到 ${SERVER}:${REMOTE_DIR}/"
rsync -az --exclude '.DS_Store' --exclude 'deploy.sh' "${LOCAL_DIR}/" "${SERVER}:${REMOTE_DIR}/"
echo "上传完成：https://neo-humans.com"
