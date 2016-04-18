FROM debian:jessie
MAINTAINER Fathi Boudra <fboudra@gmail.com>

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y devscripts \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
 autoconf \
 automake \
 bash-completion \
 bc \
 bison \
 build-essential \
 ccache \
 cpio \
 curl \
 debhelper \
 debian-archive-keyring \
 debian-keyring \
 fakeroot \
 flex \
 gawk \
 gcc \
 gdisk \
 git \
 gperf \
 help2man \
 kpartx \
 libncurses5-dev \
 libtool-bin \
 lsb-release \
 openjdk-7-jdk \
 openssh-server \
 python-dev \
 python-simplejson \
 python-yaml \
 sudo \
 texinfo \
 time \
 unzip \
 uuid-dev \
 vim \
 wget \
 xz-utils \
 && apt-get clean \
 && rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/*

RUN useradd -m buildslave \
 && echo 'buildslave ALL = NOPASSWD: ALL' > /etc/sudoers.d/jenkins \
 && chmod 440 /etc/sudoers.d/jenkins \
 && mkdir -p /var/run/sshd /home/buildslave/bin \
 && wget -q \
 http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.22.0.tar.xz \
 https://www.busybox.net/downloads/busybox-1.19.3.tar.bz2 \
 http://europe.asustor.com/download/adm/AS50XX_2.5.4.RF42.img \
 http://downloads.sourceforge.net/project/asgpl/ADM2.5.4/GPL_2.5.4RF42/arm/GPL_linux-3.10.70.tar.bz2 \
 http://downloads.sourceforge.net/project/asgpl/ADM2.5.4/GPL_2.5.4RF42/arm/linux-3.10.70-arm.config \
 http://downloads.sourceforge.net/project/asgpl/ADM2.5.4/GPL_2.5.4RF42/x86/GPL_linux-3.4.26.tar.bz2 \
 http://downloads.sourceforge.net/project/asgpl/ADM2.5.4/GPL_2.5.4RF42/x86/linux-3.4.26-i386.config \
 http://downloads.sourceforge.net/project/asgpl/ADM2.5.4/GPL_2.5.4RF42/x64/GPL_linux-3.12.20.tar.bz2 \
 http://downloads.sourceforge.net/project/asgpl/ADM2.5.4/GPL_2.5.4RF42/x64/GPL_linux-4.1.0.tar.bz2 \
 http://downloads.sourceforge.net/project/asgpl/ADM2.5.4/GPL_2.5.4RF42/x64/linux-3.12.20-x86_64.config \
 http://downloads.sourceforge.net/project/asgpl/ADM2.5.4/GPL_2.5.4RF42/x64/linux-4.1.0-x86_64.config \
 && git clone -b master --depth 1 https://github.com/fboudra/asustor-pkg-utilities.git \
 && git clone -b master https://github.com/fboudra/asustor-toolchain.git \
 && chown buildslave:buildslave *.tar.xz *.tar.bz2 *.img linux-*.config \
 && mv *.tar.xz *.tar.bz2 *.img linux-*.config asustor-pkg-utilities asustor-toolchain /home/buildslave/ \
 && ln -s /home/buildslave/asustor-pkg-utilities/apkg-tool /home/buildslave/bin/apkg-tool \
 && ln -s /home/buildslave/asustor-pkg-utilities/apkg-tools.py /home/buildslave/bin/apkg-tools.py \
 && ln -s /home/buildslave/asustor-pkg-utilities/extract-admimage.sh /home/buildslave/bin/extract-admimage.sh \
 && ln -s /home/buildslave/asustor-pkg-utilities/yaml-to-json.py /home/buildslave/bin/yaml-to-json.py \
 && chmod a+x /home/buildslave/bin/* \
 && chown -R buildslave:buildslave /home/buildslave/bin /home/buildslave/asustor-pkg-utilities /home/buildslave/asustor-toolchain

EXPOSE 22
CMD ["/bin/bash"]
