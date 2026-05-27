#!/usr/bin/env bash
set -e

if [ -f /data/params ]; then
    set -a
    # shellcheck disable=SC1091
    source /data/params
    set +a
fi

MONGO_CONN="${MONGO_URL:-mongodb://mongodb:27017/users}"
echo "Seeding MongoDB at ${MONGO_CONN}..."
mongosh "$MONGO_CONN" --file /db/master-data.js
echo "User database setup complete"
