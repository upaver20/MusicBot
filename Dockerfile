FROM alpine

MAINTAINER upaver20, https://upaver20.com

RUN apk update \
 && apk add ca-certificates ffmpeg x264 python3 \
 && apk add --no-cache --virtual=.build-deps openssl-dev python3-dev git libffi-dev libsodium-dev alpine-sdk gdbm-dev libc-dev zlib-dev sqlite-dev tk-dev \
 && git clone https://github.com/upaver20/MusicBot.git MusicBot -b master \
 && cd /MusicBot \
 && python3 -m pip install --upgrade pip \
 && python3 -m pip install --upgrade -r requirements.txt\ 
 && apk del --purge .build-deps \

VOLUME /MusicBot/config

WORKDIR /MusicBot

CMD python3 run.py
