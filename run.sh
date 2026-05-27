#!/usr/bin/env bash
set -e

if [ -f /data/params ]; then
    set -a
    # shellcheck disable=SC1091
    source /data/params
    set +a
fi

export MONGO_URL="${MONGO_URL:-mongodb://mongodb:27017/users}"
export JWT_SECRET="${JWT_SECRET:-roboshop-secret-key}"
export PORT="${USER_SERVER_PORT:-8080}"

exec node server.js
