# rttys-for-arm64
rttys-for-arm64 on docker

Use:
```bash
docker run -d \
   --name rttys \
   -p 5912:5912 \
   -p 5913:5913 \
   -v ~/.config/rttys.conf:/etc/rttys/rttys.conf \
   -v /etc/rttys/rttys.crt:/etc/rttys/rttys.crt \
   -v /etc/rttys/rttys.key:/etc/rttys/rttys.key \
   --restart=always \
   dennischancs/rttys
```

`rttys.conf` below: 
```conf
#addr-dev: :5912
#addr-user: :5913

# Auth for http
http-username: rttys
http-password: rttys

#ssl-cert: /etc/rttys/rttys.crt
#ssl-key: /etc/rttys/rttys.key

#base-url: /

#token: a1d4cdb1a3cd6a0e94aa3599afcddcf5

# font-size: 16

# No login required to connect device.
# Values can be device IDs separated by spaces,
# or a "*" indicates that all devices do not require login
# http://localhost:5913/connect/rtty1
#white-list: "*"
#white-list: rtty1 rtty2
```

More details: [zhaojh329/rttys](https://github.com/zhaojh329/rttys/issues)