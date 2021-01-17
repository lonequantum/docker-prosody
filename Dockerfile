FROM alpine:latest

MAINTAINER lonequantum@lnode.net

ENV PROSODY_VER=0.11.7

RUN    apk update \
    && apk add --no-cache \
       build-base \
       curl \
       git \
       linux-headers \
       libidn \
       libidn-dev \
       lua \
       lua-dev \
       lua-expat \
       luarocks \
       make \
       openssl \
       openssl-dev \
       readline-dev \
       unbound-dev \
    && curl -O https://prosody.im/downloads/source/prosody-${PROSODY_VER}.tar.gz \
    && tar -xzf prosody-${PROSODY_VER}.tar.gz \
    && cd /usr/bin \
    && for e in luarocks-*; do ln -s $e ${e%-*}; done \
    && luarocks install readline \
    && luarocks install luaunbound \
    && luarocks install luasec \
    && luarocks install luabitop \
    && luarocks install luasocket \
    && luarocks install luafilesystem \
    && cd /prosody-${PROSODY_VER} \
    && ./configure \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && make install \
    && cd / \
    && apk del \
       build-base \
       curl \
       git \
       linux-headers \
       libidn-dev \
       lua-dev \
       make \
       openssl-dev \
       readline-dev \
       unbound-dev \
    && rm -rf /prosody-* \
       /var/cache/apk/* \
    && adduser -S prosody \
    && addgroup -S prosody \
    && cd /usr/local \
    && mv etc/prosody/prosody.cfg.lua share/prosody.cfg.lua.dist

EXPOSE 5222
EXPOSE 5269

