#!/bin/sh
set -m

mongodb_cmd="mongod"
mkdir -p /mongodb/log
cmd="$mongodb_cmd --httpinterface --rest --master --logpath /mongodb/log/wiretiger.log"
if [ "$AUTH" == "yes" ]; then
    cmd="$cmd --auth"
fi

if [ "$JOURNALING" == "no" ]; then
    cmd="$cmd --nojournal"
fi

if [ "$OPLOG_SIZE" != "" ]; then
    cmd="$cmd --oplogSize $OPLOG_SIZE"
fi
# set mongo memory
if [ "$WIREDTIGERCACHESIZEGB" != "" ]; then
    cmd="$cmd --wiredTigerCacheSizeGB $WIREDTIGERCACHESIZEGB"
fi

$cmd &

if [ ! -f /data/db/.init_db ]; then
    /init_db.sh
fi

fg

