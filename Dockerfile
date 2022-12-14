FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y wget

ENV TZ=Asia/Kolkata \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y build-essential tcl8.6

RUN wget https://download.redis.io/redis-stable.tar.gz

RUN tar xzf redis-stable.tar.gz

RUN cd redis-stable && make && make install

RUN ./redis-stable/utils/install_server.sh

EXPOSE 6379

ENTRYPOINT ["redis-server"]

