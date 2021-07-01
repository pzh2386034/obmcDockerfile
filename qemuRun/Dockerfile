FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
	bash \
	build-essential \
	ca-certificates \
	chrpath \
	curl \
	diffstat \
	gawk \
	apt-utils \
	sudo \
	iputils-ping \
    iproute2 \
	git \
	libpixman-1-0 \
	libsdl1.2-dev \
	texinfo \
	&& rm -rf /var/lib/apt/lists/*

# Download the latest qemu build from openBMC's fork
#RUN curl -sSL -o /usr/bin/qemu-system-arm https://openpower.xyz/job/openbmc-qemu-build-merge-x86/lastSuccessfulBuild/artifact/qemu/arm-softmmu/qemu-system-arm  &&chmod +x /usr/bin/qemu-system-arm

# Download the latest romulus image
RUN mkdir -p /usr/src/openbmc
COPY tools/qemu-system-arm  /usr/bin/qemu-system-arm

ENTRYPOINT ["qemu-system-arm",  "-m", "256", "-M", "ast2600-evb", "-nographic", "-drive", "file=/usr/share/obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd", "-net", "nic", "-net", "user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu"]
# docker run -it --rm -v /wks:/usr/share rqemu:v2 
# docker run -d -v /wks:/usr/share --net host rqemu:v2