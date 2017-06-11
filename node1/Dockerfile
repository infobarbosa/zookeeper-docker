FROM openjdk:8-jre-alpine
MAINTAINER Justin Plock <justin@plock.net>

ARG MIRROR=http://apache.mirrors.pair.com
ARG VERSION=3.4.9

LABEL name="zookeeper" version=$VERSION

RUN apk add --no-cache wget bash \
    && mkdir /opt \
    && wget -q -O - $MIRROR/zookeeper/zookeeper-$VERSION/zookeeper-$VERSION.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-$VERSION /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
    && mkdir -p /tmp/zookeeper \
    && mkdir -p /opt/zookeeper/data \
    && mkdir -p /var/zookeeper/logs \
    && echo "tickTime=2000" >> /opt/zookeeper/conf/zoo.cfg \
    && echo "dataDir=/opt/zookeeper/data" >> /opt/zookeeper/conf/zoo.cfg \
    && echo "dataLogDir=/var/zookeeper/logs" >> /opt/zookeeper/conf/zoo.cfg \
    && echo "clientPort=2181" >> /opt/zookeeper/conf/zoo.cfg \
    && echo "initLimit=10" >> /opt/zookeeper/conf/zoo.cfg \
    && echo "syncLimit=5" >> /opt/zookeeper/conf/zoo.cfg \
    && echo "server.1=172.17.0.11:2888:3888" >> /opt/zookeeper/conf/zoo.cfg \
    && echo "server.2=172.17.0.12:2888:3888" >> /opt/zookeeper/conf/zoo.cfg \
    && echo "server.3=172.17.0.13:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
    && echo "1" >> /opt/zookeeper/data/myid

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]

