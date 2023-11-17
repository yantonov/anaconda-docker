FROM ubuntu:22.04

MAINTAINER Yury Antonov <1390348+yantonov@users.noreply.github.com>

ENV \
    ANACONDA_HOME=/opt/conda \
    ANACONDA_VERSION=2023.09-0 \
    ANACONDA_SHA256=6c8a4abb36fbb711dc055b7049a23bbfd61d356de9468b41c5140f8a11abd851 \
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
    echo "${ANACONDA_SHA256}  anaconda.sh" > anaconda.hash && \
    echo anaconda.hash && \
    if [ "$(sha256sum -c anaconda.hash | awk '{print $2}')" != "OK" ] ; then echo 'invalid hash sum'; ls -la; exit 1; fi && \
    sh ./anaconda.sh -b -p ${ANACONDA_HOME} && \
    rm anaconda.sh anaconda.hash

ENV \
    # TODO: think about using ${ANACONDA_HOME}/etc/profile.d/conda.sh
    PATH=${ANACONDA_HOME}/bin:${PATH}

RUN pip install --upgrade pip && \
    conda update conda -y

ADD files/* /root/

WORKDIR /src

ENTRYPOINT [ "/root/init.sh" ]
