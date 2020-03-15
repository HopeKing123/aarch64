FROM arm32v7/ubuntu:16.04
ENV DEBIAN_FRONTEND teletype
MAINTAINER docker_user wangzhanbao1@gmail.com
COPY qemu-arm-static /usr/bin/qemu-arm-static
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN \
  apt-get update \
  && \ 
  apt-get install -y --no-install-recommends \
    net-tools \
    wget \
    lrzsz \
    sysv-rc-conf \
    nginx 
RUN cp /usr/sbin/sysv-rc-conf /usr/sbin/chkconfig
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#Exposed port
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
