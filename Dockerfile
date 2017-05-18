FROM debian:stretch

MAINTAINER upaver20, https://upaver20.com

#Install dependencies
RUN apt-get update \
   && apt-get upgrade -y

RUN apt-get update \
   && apt-get install git libopus-dev libffi-dev libsodium-dev build-essential libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl python3.5 python3-pip -y

RUN git clone https://github.com/upaver20/MusicBot.git MusicBot -b master

WORKDIR /MusicBot

#Install PIP dependencies
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade -r requirements.txt

#Add volume for configuration
VOLUME /musicBot/config

CMD python3 run.py
