from darrenclark/android-build-base

#Nougat-x86 reqs

run apt-get update && \
  apt-get install -y software-properties-common &&\
  add-apt-repository -y ppa:openjdk-r/ppa  && \
  apt-get update && \
  apt-get install -y openjdk-8-jdk && \
  apt-get install -y libssl-dev && \
  rm -rf /var/lib/apt/lists/*


