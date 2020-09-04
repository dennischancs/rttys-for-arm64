FROM golang:alpine as builder
WORKDIR /build
RUN cd /build && \
    apk update && apk add --no-cache wget && \
    #git clone https://github.com/zhaojh329/rttys.git && \
    #wget -O index.html https://raw.githubusercontent.com/dennischancs/rttys-for-arm64/master/index.html && \
    wget -O rttys-master.zip https://raw.githubusercontent.com/dennischancs/rttys-for-arm64/master/selfuse/rttys-master.zip && \
    # cp -f index.html rttys/frontend/public/ && \
    unzip rttys-master.zip && \
    cd rttys-master && \
    # cp -f statik.go rttys/statik/ && \
    cd rttys-master && go build

FROM alpine:edge
# for arm64
COPY --from=builder /build/rttys-master/rttys /usr/bin/rttys
COPY --from=builder /build/rttys-master/rttys.conf /etc/rttys/rttys.conf

ENTRYPOINT /usr/bin/rttys -conf /etc/rttys/rttys.conf
