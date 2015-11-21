# android-build

Dockerfiles and related scripts for Android OS build environments

Since various forks of Android have various(and sometimes conflicting) build requirements, I decided to start creating Docker containers
to do my builds.

Since I work primarily with Android-x86(http://android-x86.org), so I started there. I will add as I find necessary, or pull requests are always welcome.

There are currently images to build the kitkat-x86 and lollipop-x86 branches of Android-x86.

Note: These images DO NOT pull the source code.

Simple use case:

`docker run --rm -ti -e ANDROID_BUILD_PRODUCT=android_x86-eng -e ANDROID_BUILD_JOBS=4 -e ANDROID_BUILD_UID=$(id -u) -e ANDROID_BUILD_TARGET=iso_img -v <path-to-source>:/source darrenclark/android-build-lollipop-x86`

That will build run `lunch android_x86-eng` then `m -j4 iso_img`, with output being in `<path-to-source>/out` on the host.
It will also create user with the specified user id and execute the build as that user. If this is not provided, it will execute as root.

In addition to the Android build environment variables, the following are also used:

| Variable              | Meaning                                       | Default            |
|-----------------------|-----------------------------------------------|--------------------|
| ANDROID_BUILD_PRODUCT | Product to build(e.g. from the lunch menu)    | <none>             |
| ANDROID_BUILD_JOBS    | Concurrent build jobs (e.g -j parameter to m) | 1                  |
| ANDROID_BUILD_TARGET  | Target to make                                | <none>             |
| ANDROID_BUILD_UID     | UID for the build user                        | 0                  |
| ANDROID_BUILD_GID     | GID for the build user                        | ANDROID_BUILD_UID |
