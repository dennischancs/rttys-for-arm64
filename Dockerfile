FROM golang:alpine as builder
WORKDIR /build
RUN cd /build && \
    apk update && apk add --no-cache git wget && \
    git clone https://github.com/zhaojh329/rttys.git && \
    #wget -O index.html https://raw.githubusercontent.com/dennischancs/rttys-for-arm64/master/index.html && \
    wget -O statik.go https://raw.githubusercontent.com/dennischancs/rttys-for-arm64/master/statik.go && \
    # cp -f index.html rttys/frontend/public/ && \
    cp -f statik.go rttys/statik/ && \
    cd rttys && go build

FROM alpine:edge
# for arm64
COPY --from=builder /build/rttys/rttys /usr/bin/rttys
COPY --from=builder /build/rttys/rttys.conf /etc/rttys/rttys.conf

ENTRYPOINT /usr/bin/rttys -conf /etc/rttys/rttys.conf
