#!/usr/bin/env bash
set -euo pipefail

SERVER="${SERVER:-root@45.76.148.137}"
SSH_PORT="${SSH_PORT:-2222}"
REMOTE_DIR="${REMOTE_DIR:-/var/www/neo-humans}"

echo "正在让 ${SERVER} 从 GitHub 拉取最新版本..."
ssh -p "${SSH_PORT}" "${SERVER}" "git -C '${REMOTE_DIR}' pull --ff-only"
echo "更新完成：https://neo-humans.com"
