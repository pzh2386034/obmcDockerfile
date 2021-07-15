FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y libpam0g-dev libssl-dev zlib1g-dev pkg-config xxd cmake nlohmann-json3-dev libmysqlclient-dev libmysql++-dev vim libcurl4 libcurl4-openssl-dev\
    sudo libgtest-dev libgmock-dev  python3 autoconf-archive autoconf  libtinyxml2-dev dumb-init\
    build-essential git libtcmalloc-minimal4 libboost1.71-dev

RUN  sudo ln -s /usr/lib/libtcmalloc_minimal.so.4 /usr/lib/libtcmalloc_minimal.so

ADD . /source

    #git clone -b work https://github.com/pzh2386034/bmcweb.git && meson builddir && ninja -C builddir &&  cp builddir/bmcweb /usr/bin/bmcweb
# cd /source/libzdb &&  ./configure --without-postgresql --without-sqlite --without-oci && make && sudo make install


ENV USERNAME=pan
ENV HOME=/build

RUN groupadd -g 1002 ${USERNAME} && \ 
    useradd -N --create-home --home-dir $HOME -u 1002 -g 1002 ${USERNAME} && \
    chown -R ${USERNAME}:${USERNAME} $HOME

#RUN  echo "zeuspan ALL=(ALL)       ALL" >> /etc/sudoers  && echo 'zeuspan:docker' >> /root/passwdfile \
##	&& chpasswd -c SHA512 < /root/passwdfile 

WORKDIR /build
USER $USERNAME

CMD ["/bin/bash"]
# docker run -it --rm --net=host -v /home/zeuspan/source:/build work-test:v4