FROM alpine:edge

COPY ./repositories /etc/apk/repositories

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer / && \
    apk add --no-cache bird wget && \
    apk add --no-cache --virtual .build-deps git go make && \
    go env -w GOPROXY=https://goproxy.cn && \
    git clone https://github.com/xddxdd/bird-lg-go.git && cd bird-lg-go && \
    make proxy && install -m 755 proxy/proxy /usr/local/bin/proxy && \
    cd .. && rm -rf bird-lg-go /root/go && \
    apk del .build-deps

COPY ./root /

ENTRYPOINT ["/entry.sh"]
