FROM phusion/baseimage:latest
RUN apt-get -y update && apt-get -y install build-essential \
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
        git && \
    git clone --single-branch --branch=master https://github.com/Cisco-Talos/clamav-devel.git && \
    cd clamav-devel && \
     ./configure --prefix="" --with-systemdsystemunitdir=no --with-dbdir=/usr/share/clamav && \
     make -j2 && make install && \
    apt-get purge -y git build-essential && \
    apt-get clean && apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* /clamav-devel &&
    useradd clamav && \
    mkdir -p /usr/share/clamav && cd /usr/share/clamav && \
    curl -O --remote-header-name -fSL http://database.clamav.net/main.cvd && \
    curl -O --remote-header-name -fSL http://database.clamav.net/daily.cvd && \
    curl -O --remote-header-name -fSL http://database.clamav.net/bytecode.cvd && \
    chown clamav.clamav /usr/share/clamav
CMD ["/sbin/my_init", "--skip-runit", "--skip-startup-files", "setuser", "clamav", "bash"]
