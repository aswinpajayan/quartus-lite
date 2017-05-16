FROM debian:jessie-backports

# basic packages
RUN apt-get update && \
    apt-get -y install git expect emacs24-nox libtcmalloc-minimal4 locales wget

# Set LOCALE to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

# adding scripts
ADD files/setup /root/
ADD files/.profile /root/

# install quartus prime
RUN mkdir -p /root/quartus && \
    cd /root/quartus && \
    wget http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_tar/Quartus-lite-17.0.0.595-linux.tar && \
    tar xvf Quartus-lite-17.0.0.595-linux.tar && \
    /root/setup 17.0 && \
    rm -rf /root/quartus
