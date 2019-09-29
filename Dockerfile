# https://github.com/sjqzhang/go-fastdfs
# https://github.com/perfree/go-fastdfs-web
FROM sjqzhang/go-fastdfs:latest

LABEL Maintainer="Ansley Leung" \
      Description="go-fastdfs with go-fastdfs-web." \
      License="MIT License" \
      Version="1.3.3"

ENV TZ=Asia/Shanghai
RUN set -ex && \
    apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# java runtime 8
RUN set -ex && \
    apk add --no-cache coreutils curl openjdk8-jre && \
    ln -snf /usr/lib/jvm/java-1.8-openjdk/bin/java /usr/bin/java && \
    rm -rf /tmp/* /var/cache/apk/*

# go-fastdfs-web
RUN set -ex && \
    curl -SL https://github.com/perfree/go-fastdfs-web/releases/download/1.1.2/go-fastdfs-web-1.1.2.zip -o /tmp/go-fastdfs-web.zip && \
    unzip -q /tmp/go-fastdfs-web.zip -d /opt && \
    rm -rf /tmp/* /var/cache/apk/*


COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

# Expose Ports
EXPOSE 8080
EXPOSE 8088


ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["fileserver" , "${OPTS}"]
