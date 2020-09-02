FROM alpine:edge
# for arm64

ENV RTTYS_VERSION 3.1.3

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache wget  \
    && export all_proxy='socks5://192.168.1.108:7890' http_proxy='http://192.168.1.108:7890' https_proxy='http://192.168.1.108:7890' \
    && cd /tmp \
    &&  wget --no-check-certificate -c https://github.com/zhaojh329/rttys/files/4334191/rttys-linux-arm64.tar.gz \
    &&  tar -xf rttys-linux-arm64.tar.gz  \
    &&  cp rttys*/rttys /usr/bin/ \
    &&  mkdir -p /etc/rttys \
    &&  cp rttys*/rttys.conf /etc/rttys/  \
    &&  rm -rf /tmp/* \
    &&  unset all_proxy https_proxy http_proxy \
    &&  apk del wget

ENTRYPOINT /usr/bin/rttys -conf /etc/rttys/rttys.conf
