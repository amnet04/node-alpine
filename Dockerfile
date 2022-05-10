FROM alpine:3.14

RUN apk update upgrade --no-cache && \
    apk add --no-cache  --virtual .build-deps binutils-gold gcc g++ libgcc make \
        python2 linux-headers && \
    apk add --no-cache libstdc++ git && \
    # ln -s /usr/bin/python3 /usr/bin/python && \
    git clone https://github.com/nodejs/node.git && \
    cd node && git checkout v8.x && \
    ./configure --prefix=/opt && \
    make -j8 && \
    make install && \
    ln -s /opt/bin/node /bin/node && \
    ln -s /opt/bin/npm /bin/npm && \
    apk del .build-deps && \
    rm -Rf /node  
