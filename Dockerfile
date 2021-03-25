  
FROM ubuntu:20.04

MAINTAINER WinuxDev <xxx@xxx.com>
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends curl openjdk-11-jdk npm gcc g++ make tzdata ca-certificates openssl git tar sqlite fontconfig nodejs maven
RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata
RUN adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container


WORKDIR /home/container
RUN cd /home/container && curl -LJO https://github.com/jing-shiun/WinuxHub-dockerfile/main/entrypoint.sh
COPY        ./entrypoint.sh /entrypoint.sh
CMD ["bin/bash", "entrypoint.sh"]
