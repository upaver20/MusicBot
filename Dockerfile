FROM alpine

MAINTAINER upaver20, https://upaver20.com

RUN apk update \
 && apk add git libffi-dev libsodium-dev alpine-sdk gdbm-dev libc-dev zlib-dev sqlite-dev tk-dev openssl-dev openssl python3 ffmpeg x264 python3-dev \
 && git clone https://github.com/upaver20/MusicBot.git MusicBot -b master \
 && cd /MusicBot \
 && python3 -m pip install --upgrade pip \
 && python3 -m pip install --upgrade -r requirements.txt

VOLUME /musicBot/config

CMD python3 run.py
