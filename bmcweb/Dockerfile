FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y libpam0g-dev libssl-dev zlib1g-dev pkg-config xxd cmake nlohmann-json3-dev libmysqlclient-dev libmysql++-dev vim libcurl4 libcurl4-openssl-dev\
    sudo libgtest-dev libgmock-dev ninja-build python3 autoconf-archive autoconf  libtinyxml2-dev dumb-init\
    build-essential git libsystemd-dev systemd python3-wheel python3-pip \
    python3-yaml python3-mako python3-inflection python3-setuptools && \
    pip3 install meson

ADD . /source
RUN cd /source &&  tar -jxvf  boost-1_75_0.tar.bz2 && cd boost_1_75_0 && ./bootstrap.sh && ./b2 && ./b2 install

RUN cd /source && cd sdbusplus && meson build && cd build && ninja &&  ninja install 

RUN cp /source/bmcweb.service /lib/systemd/system && cp /source/bmcweb.socket /lib/systemd/system  && ln -s /lib/systemd/system/bmcweb.socket /lib/systemd/system/sockets.target.wants/bmcweb.socket 

    #git clone -b work https://github.com/pzh2386034/bmcweb.git && meson builddir && ninja -C builddir &&  cp builddir/bmcweb /usr/bin/bmcweb
# cd /source/libzdb &&  ./configure --without-postgresql --without-sqlite --without-oci && make && sudo make install


ENV USERNAME=zeuspan
ENV HOME=/build

RUN groupadd -g 1002 ${USERNAME} && \ 
    useradd -N --create-home --home-dir $HOME -u 1002 -g 1002 ${USERNAME} && \
    chown -R ${USERNAME}:${USERNAME} $HOME && \
    echo "zeuspan ALL=(ALL)       ALL" >> /etc/sudoers 

RUN  echo 'zeuspan:docker' >> /root/passwdfile \
	&& chpasswd -c SHA512 < /root/passwdfile 

WORKDIR /build
USER $USERNAME

CMD ["/bin/bash"]
# docker run -it --rm --net=host -v /home/zeuspan/source:/build work-test:v4
