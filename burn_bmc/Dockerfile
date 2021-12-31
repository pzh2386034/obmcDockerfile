FROM centos:7
MAINTAINER zeuspan
LABEL version="1.0" location="shenzhen" type="centos-with-ssh"
RUN yum update -y;yum install openssh* -y;yum install vim -y;yum install initscripts git gcc gcc-c++  python3 cmake make wget autoconf automake libtool autoconf-archive pkg-config -y;

RUN yum install centos-release-scl -y; yum install devtoolset-9 -y

RUN pip3 install meson ninja

RUN wget http://www.cmake.org/files/v3.8/cmake-3.8.2.tar.gz && tar -zxvf cmake-3.8.2.tar.gz && cd cmake-3.8.2 && ./bootstrap --prefix=/usr/local && make && make install && echo "PATH=/usr/local/bin:$PATH:$HOME/bin" >> ~/.bash_profile && echo "scl enable devtoolset-9 " >> ~/.bash_profile
#SHELL [ "/usr/bin/scl", "enable", "devtoolset-9"]

RUN git clone https://github.com/fmtlib/fmt.git && cd fmt   && git checkout -b com c5aafd8f && mkdir build && cd build && cmake .. && make && make install && cd /

RUN git clone https://gitlab.freedesktop.org/xorg/lib/libpciaccess.git && cd libpciaccess && git checkout -b com 9c01fdd && ./autogen.sh && make && make install && cd /
RUN git clone https://gitlab.freedesktop.org/xorg/util/macros.git && cd macros &&  git checkout -b com   b876630 && ./autogen.sh --prefix=/usr && make install && cd /
RUN git clone https://github.com/martinmoene/span-lite.git && cd span-lite && git checkout -b com 337af6e && mkdir build && cd build && cmake .. && make && make install && cd /
RUN git clone https://github.com/openbmc/ipmi-blob-tool.git && cd ipmi-blob-tool && git checkout -b com d46530f && ./bootstrap.sh && ./configure && make &&make install && cd /

RUN git clone  https://github.com/pzh2386034/stdplus.git && cd stdplus && mkdir build && cd build && cmake .. && make && make install && cd /

RUN git clone   https://github.com/pzh2386034/phosphor-ipmi-flash.git && cd phosphor-ipmi-flash && ./bootstrap.sh && ./configure --disable-build-bmc-blob-handler && make &&make install


RUN service sshd restart
EXPOSE 23
VOLUME ["/data"]
COPY . /data
RUN chmod +x /data/red.sh
WORKDIR /root
USER root
ENTRYPOINT //data/red.sh && /bin/bash
