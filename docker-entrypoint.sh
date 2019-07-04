#!/bin/sh

# ps -ef |grep java|grep go-fastdfs-web.jar|grep -v grep

cd /opt/go-fastdfs-web/
nohup java -jar go-fastdfs-web.jar > /dev/null 2>&1 &

cd $INSTALL_DIR

exec "$@"