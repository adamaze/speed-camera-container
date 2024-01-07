FROM ubuntu

RUN apt-get update && apt-get upgrade

# avoid any prompts
ENV DEBIAN_FRONTEND noninteractive
# install tzdata package
RUN apt-get install -y tzdata
# set your timezone
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

# speed camera install
RUN apt-get install -y curl wget unzip sudo dos2unix
RUN curl -L https://raw.github.com/pageauc/rpi-speed-camera/master/speed-install.sh | bash

COPY speed-camera-docker-run.sh /root/speed-camera/speed-camera-docker-run.sh
