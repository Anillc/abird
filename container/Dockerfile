FROM ubuntu:latest

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y bird2 || true && \
    rm -rf /etc/bird

COPY ./root /

ENTRYPOINT /entry.sh
