FROM alpine

MAINTAINER upaver20, https://upaver20.com

RUN apk update
RUN apk add git libffi-dev libsodium-dev alpine-sdk gdbm-dev libc-dev zlib-dev sqlite-dev tk-dev openssl-dev openssl python3 ffmpeg x264 python3-dev

RUN git clone https://github.com/upaver20/MusicBot.git MusicBot -b master

WORKDIR /MusicBot

#Install PIP dependencies
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade -r requirements.txt

#Add volume for configuration
VOLUME /musicBot/config

CMD python3 run.py
