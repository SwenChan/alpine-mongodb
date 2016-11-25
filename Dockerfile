FROM swenchancn/alpine
MAINTAINER SwenChan <a274979395@163.com>

RUN apk upgrade --update && apk add --no-cache mongodb --reposity http://mirrors.aliyun.com/alpine/edge/testing

VOLUME /data/db
VOLUME /var/log/mongodb

ENV AUTH=yes \
    STORAGE_ENGINE=wiredTiger \
    JOURNALING=yes

ADD run.sh /run.sh
ADD init_db.sh /init_db.sh

EXPOSE 27017 28017

CMD ["/run.sh"]
