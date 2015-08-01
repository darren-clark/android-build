from darrenclark/android-build-base

#Lollipop-x86 reqs

run apt-get update && \
  apt-get install -y \
    openjdk-7-jdk \
    curl && \
 rm -rf /var/lib/apt/lists/*

add build /usr/local/bin/build
cmd ["/usr/local/bin/build"]

