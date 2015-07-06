from ubuntu:14.04

workdir /source 
volume /source

add build /usr/local/bin/build

RUN echo debconf debconf/frontend select Noninteractive | debconf-set-selections
RUN echo APT::Install-Recommends \"0\"\; > /etc/apt/apt.conf.d/01norecommend
run dpkg --add-architecture i386

run apt-get update && \
  apt-get install -y \
    build-essential \
    git \
    g++-multilib \
    zlib1g:i386 \ 
    libxml2-utils \
    squashfs-tools \
    python \
    bison \
    zip \
    unzip \
    bc \
    gperf \
    gettext \
    genisoimage \
    syslinux && \
  rm -rf /var/lib/apt/lists/*

#Lollipop-x86 reqs

run apt-get update && \
  apt-get install -y \
    openjdk-7-jdk \
    python-mako \
    curl && \
 rm -rf /var/lib/apt/lists/*
