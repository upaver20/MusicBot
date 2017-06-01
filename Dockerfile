FROM alpine

MAINTAINER upaver20, https://upaver20.com

RUN apk update \
 && apk --update --no-cache --virtual=.build-deps git libffi-dev libsodium-dev alpine-sdk gdbm-dev libc-dev zlib-dev sqlite-dev tk-dev python3-dev openssl-dev \
 && apk add openssl python3 ffmpeg x264  \
 && git clone https://github.com/upaver20/MusicBot.git MusicBot -b master \
 && cd /MusicBot \
 && python3 -m pip install --upgrade pip \
 && python3 -m pip install --upgrade -r requirements.txt \
 $$ apk del .build-deps

VOLUME /musicBot/config

CMD python3 run.py
