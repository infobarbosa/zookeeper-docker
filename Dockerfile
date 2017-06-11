FROM openjdk:8-jre-alpine
MAINTAINER Marcelo Barbosa <infobarbosa@yahoo.com.br>

ARG MIRROR=http://apache.mirrors.pair.com
ARG VERSION=3.4.10

LABEL name="zookeeper" version=$VERSION

RUN apk add --no-cache wget bash \
    && mkdir /opt \
    && wget -q -O - $MIRROR/zookeeper/zookeeper-$VERSION/zookeeper-$VERSION.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-$VERSION /opt/zookeeper \
    && mkdir -p /tmp/zookeeper/scripts \
    && mkdir -p /opt/zookeeper/data \
    && mkdir -p /var/zookeeper/logs \

COPY scripts/start-zookeeper.sh /tmp/zookeeper/scripts/

EXPOSE 2181 2888 3888

WORKDIR /tmp/zookeeper

ENTRYPOINT ["/tmp/scripts/zookeeper/start-zookeeper.sh"]
CMD ["start-foreground"]

