#!/bin/sh

# ps -ef |grep java|grep go-fastdfs-web.jar|grep -v grep

if [ -s "/go-fastdfs-web/go-fastdfs-web.jar" ]; then
    cp -f /opt/go-fastdfs-web/go-fastdfs-web.jar /go-fastdfs-web/go-fastdfs-web.jar
else
    cp -fr /opt/go-fastdfs-web /
fi

cd /go-fastdfs-web
nohup java -jar go-fastdfs-web.jar > /dev/null 2>&1 &

cd $INSTALL_DIR

exec "$@"
