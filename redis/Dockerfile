FROM docker.io/arm32v7/ubuntu:16.04
MAINTAINER wangzhanbiao1@gmail.com
COPY qemu-arm-static /usr/bin/qemu-arm-static
RUN \
  apt-get update \
  && \ 
  apt-get install -y --no-install-recommends \
    apt-utils net-tools \
    wget \
    lrzsz \
    sysv-rc-conf \
    vim \
    tzdata \
    redis-server 
#
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN cp /usr/sbin/sysv-rc-conf /usr/sbin/chkconfig
RUN /bin/sed -i -e '/^bind/s/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf
RUN /bin/sed -i -e 's@protected-mode yes@protected-mode no@g' /etc/redis/redis.conf
RUN /bin/echo "requirepass 123456" >> /etc/redis/redis.conf
#storge
VOLUME /etc/redis/
#expose port
EXPOSE 6379
#HEALTHCHECK --interval=10m --timeout=1m
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh
ENTRYPOINT [ "/usr/local/bin/run.sh" ]

