FROM alpine:3.14

RUN apk update upgrade --no-cache && \
    apk add --no-cache  --virtual .build-deps binutils-gold gcc g++ libgcc make \
        python2 linux-headers && \
    apk add --no-cache libstdc++ git && \
    git clone https://github.com/nodejs/node.git && \
    cd node && git checkout v8.x && \
    ./configure --prefix=/opt/node && \
    make -j8 && \
    make install && \
    apk del --purge .build-deps && \
    rm -Rf /node 
    
FROM alpine:3.14

COPY --from=0 /opt /opt

RUN apk add --no-cache libstdc++ && \
    ln -s /opt/node/bin/node /usr/local/bin/ && \
    ln -s /opt/node/bin/npm /usr/local/bin/ && \
    ln -s /opt/node/bin/npx /usr/local/bin/ && \
    rm -rf /opt/lib/node_modules/docs && \
    apk --purge del apk-tools

 
CMD ["/opt/node/bin/node"] 
