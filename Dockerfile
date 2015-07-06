from ubuntu:14.04

workdir /source 
volume /source

add build /usr/local/bin/build

run echo debconf debconf/frontend select Noninteractive | debconf-set-selections
run echo APT::Install-Recommends \"0\"\; > /etc/apt/apt.conf.d/01norecommend
run dpkg --add-architecture i386

#common x86 build requirements
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

#add oracle Java 6 for KitKat builds
run echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
	
run apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y \
    oracle-java6-installer \
    yasm \
    flex && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk6-installer
