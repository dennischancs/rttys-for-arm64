rtty client for arm64

[zhaojh329/rtty: Access your terminal from anywhere via the web.](https://github.com/zhaojh329/rtty)

Replace the following parameters with your own parameters

sudo rtty -I 'My-device-ID' -h 'your-server' -p 5912 -a -v -d 'My Device Description'

If your rttys is configured with a token, add the following parameter(Replace the following token with your own)

-t 34762d07637276694b938d23f10d7164


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