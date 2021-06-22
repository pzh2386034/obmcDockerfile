# Copyright (C) 2015-2016 Intel Corporation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# Since this Dockerfile is used in multiple images, force the builder to
# specify the BASE_DISTRO. This should hopefully prevent accidentally using
# a default, when another distro was desired.

FROM zeuspan/yocto-container:v2

USER root


# For ubuntu, do not use dash.
RUN which dash &> /dev/null && (\
    echo "dash dash/sh boolean false" | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash) || \
    echo "Skipping dash reconfigure (not applicable)"

# useradd --create-home --shell /bin/bash  /workdir && \
    
RUN userdel -r yoctouser && \
    groupadd -g 1000 obmc && \
    useradd -N -d /workdir -u 1000 -g 1000 obmc && \
    echo "obmc   ALL=(ALL)       ALL" >> /etc/sudoers 

#EXPOSE 22

RUN  echo 'obmc:docker' >> /root/passwdfile \
	&& chpasswd -c SHA512 < /root/passwdfile && \
       rm /root/passwdfile

USER obmc
ENV LANG=en_US.UTF-8
WORKDIR /workdir

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD [ "/bin/bash"]
