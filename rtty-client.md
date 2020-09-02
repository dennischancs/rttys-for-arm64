rtty client for arm64

[zhaojh329/rtty: Access your terminal from anywhere via the web.](https://github.com/zhaojh329/rtty)

**client start:**

```bash
sudo rtty \
   -I 'My-device-ID' \ # client
   -h 'your-server' \ # server ip or domain
   -p 5912 \ # server port
   -a -v -d 'My Device Description' \ # optional

also:

sudo rtty \
   -I 'My-device-ID' \ # client
   -t server_token # server token
   -a -v -d 'My Device Description' \ # optional
```

**service manage:**
1. via http://your-server-host:5913 and login

2. click the Connection button to use the web shell like SSH

3. Transfer files is easy:

    - `rtty -R` : Transfer file from local to remote device
    - `rtty -S test.txt` : Transfer file from remote device to the local


# Build libev

    git clone https://github.com/enki/libev.git
    cd libev
    ./configure --host=arm-linux-gnueabi
    DESTDIR=/tmp/rtty_install make install

# Build rtty

    git clone --recursive https://github.com/zhaojh329/rtty.git
    cd rtty
    cmake . -DCMAKE_C_COMPILER=/opt/bin/gcc -DCMAKE_FIND_ROOT_PATH=/tmp/rtty_install
    DESTDIR=/tmp/rtty_install make install

# Copy these files to your device's corresponding directory

    /tmp/rtty_install/
     └── usr/
        └── local
            ├── bin
            │   └── rtty
            ├── include
            │   ├── event.h
            │   ├── ev.h
            │   └── ev++.h
            ├── lib
            │   ├── libev.a
            │   ├── libev.la
            │   ├── libev.so -> libev.so.4.0.0
            │   ├── libev.so.4 -> libev.so.4.0.0
            │   └── libev.so.4.0.0
            └── share
                └── man
                    └── man3
                        └── ev.3


[rtty/CROSS_COMPILE.md at master · zhaojh329/rtty](https://github.com/zhaojh329/rtty/blob/master/CROSS_COMPILE.md)