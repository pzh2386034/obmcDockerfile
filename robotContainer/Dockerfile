FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yy \
    apt-utils \
    gawk \
    git \
    python3 \
    python3-pip \
    ipmitool \
    socat \
    texinfo \
    wget \
    gcc \
    libffi-dev \
    libssl-dev \
    xterm \
    mwm \
    ssh \
    vim \
    iputils-ping \
    sudo \
    cpio \
    unzip \
    diffstat \
    expect \ 
    curl \
    snmp\
    dumb-init\
    libpixman-1-0 \
	libsdl1.2-dev \
    build-essential \
	ca-certificates &&\
    apt-get -qqy --no-install-recommends install firefox && \
    apt-get -y purge firefox 

COPY tools/firefox.tar.bz2  /tmp
COPY tools/geckodriver-v0.26.0-linux64.tar.gz /tmp

RUN tar -C /opt -xjf /tmp/firefox.tar.bz2 \
         && mv /opt/firefox /opt/firefox-72.0  \
       && ln -fs /opt/firefox-72.0/firefox /usr/bin/firefox

RUN cd /tmp && tar xvzf geckodriver-*.tar.gz     \
      && mv geckodriver /usr/local/bin   \
            && chmod a+x /usr/local/bin/geckodriver

ENV HOME=/home/robot

RUN  useradd --create-home --home-dir $HOME robot &&\ 
    echo 'robot:docker' >> /root/passwdfile \
	&& chpasswd -c SHA512 < /root/passwdfile && \
       rm /root/passwdfile &&\
       echo "robot   ALL=(ALL)       ALL" >> /etc/sudoers &&\
    chown -R robot:robot ${HOME}


USER robot
WORKDIR ${HOME}
CMD /bin/bash