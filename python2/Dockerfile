FROM ubuntu:16.04

MAINTAINER Yury Antonov <yantonov@yandex.ru>

ENV \
    ANACONDA_HOME=/opt/conda \
    ANACONDA_VERSION=2019.03 \
    ANACONDA_MD5=dd87c316e211891df8889c52d9167a5d \
    ANACONDA_PYTHON_VERSION=2

RUN apt-get update && apt-get install -y \
    # required to download anaconda distribution
    curl \
    # required to extract anaconda distribution
    bzip2

RUN \
    # /src - to mount sources
    mkdir -p /src && \
    # /opt - conda target dir
    mkdir -p /opt

RUN \
    cd /opt && \
    curl -s https://repo.anaconda.com/archive/Anaconda${ANACONDA_PYTHON_VERSION}-$ANACONDA_VERSION-Linux-x86_64.sh -o anaconda.sh && \
    echo "${ANACONDA_MD5}  anaconda.sh" > anaconda.md5 && \
    if [ $(md5sum -c anaconda.md5 | awk '{print $2}') != "OK" ] ; then exit 1; fi && \
    sh ./anaconda.sh -b -p ${ANACONDA_HOME} && \
    rm anaconda.sh anaconda.md5

ENV \
    # TODO: think about using ${ANACONDA_HOME}/etc/profile.d/conda.sh
    PATH=${ANACONDA_HOME}/bin:${PATH}

RUN pip install --upgrade pip && \
    conda update conda -y

ADD files/init-jupiter.sh /root
ADD files/init.sh /root

WORKDIR /src

ENTRYPOINT [ "/root/init.sh" ]
