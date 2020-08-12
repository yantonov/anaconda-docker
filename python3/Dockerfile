FROM ubuntu:18.04

MAINTAINER Yury Antonov <yantonov@yandex.ru>

ENV \
    ANACONDA_HOME=/opt/conda \
    ANACONDA_VERSION=2020.07 \
    ANACONDA_MD5=1046c40a314ab2531e4c099741530ada \
    ANACONDA_PYTHON_VERSION=3

RUN apt-get update && \
    apt-get install -y \
    # required to download anaconda distribution
    curl \
    # required to extract anaconda distribution
    bzip2 && \
    apt-get clean

RUN \
    # /src - to mount sources
    mkdir -p /src && \
    # /opt - conda target dir
    mkdir -p /opt

RUN \
    cd /opt && \
    curl -s -L https://repo.continuum.io/archive/Anaconda${ANACONDA_PYTHON_VERSION}-${ANACONDA_VERSION}-Linux-x86_64.sh -o anaconda.sh && \
    echo "${ANACONDA_MD5}  anaconda.sh" > anaconda.md5 && \
    if [ $(md5sum -c anaconda.md5 | awk '{print $2}') != "OK" ] ; then echo 'invalid md5 sum'; ls -la; exit 1; fi && \
    sh ./anaconda.sh -b -p ${ANACONDA_HOME} && \
    rm anaconda.sh anaconda.md5

ENV \
    # TODO: think about using ${ANACONDA_HOME}/etc/profile.d/conda.sh
    PATH=${ANACONDA_HOME}/bin:${PATH}

RUN pip install --upgrade pip && \
    conda update conda -y

ADD files/* /root/

WORKDIR /src

ENTRYPOINT [ "/root/init.sh" ]
