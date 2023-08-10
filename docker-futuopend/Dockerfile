FROM ubuntu:18.04

WORKDIR /FutuOpenD
ADD ./futuopend_src/* /FutuOpenD/

COPY docker-entrypoint.sh /

RUN apt-get update
RUN apt-get install -y telnet curl bash openssh*
ENV PATH=/FutuOpenD:$PATH

EXPOSE 11111 22222 33333
CMD ["/docker-entrypoint.sh"]
