FROM zeuspan/robot-container:v5

USER root

ENV USERNAME=rbmc
# For ubuntu, do not use dash.
RUN which dash &> /dev/null && (\
    echo "dash dash/sh boolean false" | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash) || \
    echo "Skipping dash reconfigure (not applicable)"

# useradd --create-home --shell /bin/bash  /workdir && \

ENV HOME=/workdir
    
RUN userdel -r robot && \
    groupadd -g 1000 ${USERNAME} && \
    useradd -N --create-home --home-dir $HOME -u 1000 -g 1000 ${USERNAME} && \
    chown -R ${USERNAME}:${USERNAME} $HOME && \
    echo "rbmc   ALL=(ALL)       ALL" >> /etc/sudoers 

#EXPOSE 22

RUN  echo 'rbmc:docker' >> /root/passwdfile \
	&& chpasswd -c SHA512 < /root/passwdfile && \
       rm /root/passwdfile

USER ${USERNAME}
ENV LANG=en_US.UTF-8
WORKDIR ${HOME}

RUN pip3 install  --upgrade pip && pip3 install   tox     requests     retrying     websocket-client     json2yaml     robotframework   \
  robotframework-requests     robotframework-sshlibrary     robotframework-scplibrary     pysnmp     redfish   \
    beautifulsoup4 --upgrade     lxml     jsonschema     redfishtool     redfish_utilities     robotframework-httplibrary \
        robotframework-seleniumlibrary     robotframework-xvfb     robotframework-angularjs     scp     selenium    urllib3     xvfbwrapper
RUN export PATH=${HOME}/.local/bin:$PATH && mkdir ${HOME}/.ssh

ENV PATH="/workdir/.local/bin:${PATH}"


COPY scripts/build.sh ${HOME}
COPY scripts/id_rsa   ${HOME}/.ssh
COPY scripts/known_hosts ${HOME}/.ssh

USER root

RUN chown -R ${USERNAME}:${USERNAME} ${HOME}/.ssh

USER ${USERNAME}

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/bin/bash"]
#CMD ["/bin/bash", "/workdir/build.sh"]

#qemu-bmc -m 256 -M ast2600-evb -nographic -drive file=obmc-phosphor-image-starlake-20210522161937.static.mtd,format=raw,if=mtd -net nic -net user,hostfwd=:127.0.0.1:22-:22,hostfwd=:127.0.0.1:443-:443,hostname=qemu