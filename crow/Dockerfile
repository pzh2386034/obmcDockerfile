FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y libpam0g-dev libssl-dev zlib1g-dev pkg-config xxd cmake nlohmann-json3-dev libmysqlclient-dev libmysql++-dev vim libcurl4 libcurl4-openssl-dev\
    sudo libgtest-dev libgmock-dev  python3 autoconf-archive autoconf  libtinyxml2-dev dumb-init\
    build-essential git libtcmalloc-minimal4 libboost-all-dev 

RUN  sudo ln -s  /usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4 /lib/libtcmalloc_minimal.so && sudo ln -s /usr/bin/python3 /usr/bin/python
ADD . /source

    #git clone -b work https://github.com/pzh2386034/bmcweb.git && meson builddir && ninja -C builddir &&  cp builddir/bmcweb /usr/bin/bmcweb
# cd /source/libzdb &&  ./configure --without-postgresql --without-sqlite --without-oci && make && sudo make install

#RUN sudo apt install apt-transport-https curl gnupg && curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg && sudo mv bazel.gpg /etc/apt/trusted.gpg.d/ && echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list && sudo apt update && sudo apt install bazel


ENV USERNAME=pan
ENV HOME=/build

RUN groupadd -g 1000 ${USERNAME} && \ 
    useradd -N --create-home --home-dir $HOME -u 1000 -g 1000 ${USERNAME} && \
    chown -R ${USERNAME}:${USERNAME} $HOME

RUN  echo "pan ALL=(ALL)       ALL" >> /etc/sudoers  && echo 'pan:docker' >> /root/passwdfile \
	&& chpasswd -c SHA512 < /root/passwdfile 

WORKDIR /build
USER $USERNAME

RUN mkdir -p ${HOME}/.ssh && \
    chmod 0700 ${HOME}/.ssh   &&  echo"${SSH_KEY}"> ${HOME}/.ssh/id_rsa && \
    chmod 600 ${HOME}/.ssh/id_rsa
    #\ssh-keyscan github.com > ${HOME}/.ssh/known_hosts


CMD ["/bin/bash"]
# docker run -it --rm --net=host -v /home/pan/wks/webserver:/build --build-arg SSH_KEY=$(cat ~/.ssh/id_rsa) crow-build-pan