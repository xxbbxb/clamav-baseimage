#!/bin/bash
apt-get -y update
apt-get -y install build-essential \
    openssl \
    libssl-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libpng-dev \
    libxml2-dev \
    libjson-c-dev \
    libbz2-dev \
    libpcre3-dev \
    ncurses-dev \
    git
git clone --single-branch --branch=master https://github.com/Cisco-Talos/clamav-devel.git
cd clamav-devel
./configure --prefix="" --with-systemdsystemunitdir=no --with-dbdir=/usr/share/clamav
make -j2 && make install
apt-get purge -y git build-essential
apt-get clean && apt autoremove -y
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* /clamav-devel
useradd clamav
