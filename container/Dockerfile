FROM ubuntu:latest

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer / && \
    rm -rf /etc/dpkg/dpkg.cfg.d/excludes && \
    apt-get update && apt-get install -y bird2 cron curl && \
    rm -rf /etc/bird && mkdir -p /run/bird && touch /run/bird/bird.ctl

COPY ./root /

ENTRYPOINT ["/entry.sh"]
