FROM ubuntu:16.04

MAINTAINER Yury Antonov <yantonov@yandex.ru>

ENV \
    MY_USER=someuser \
    MY_UID=1001

ENV \
    ANACONDA_HOME=/opt/conda \
    ANACONDA_VERSION=2019.03 \
    ANACONDA_MD5=dd87c316e211891df8889c52d9167a5d \
    ANACONDA_PYTHON_VERSION=2

RUN apt-get update && apt-get install -y \
    curl \
    bzip2


RUN useradd -m -s /bin/bash -u ${MY_UID} ${MY_USER}

RUN \
    # /src - to mount sources
    mkdir -p /src && \
    # /opt - conda target dir
    mkdir -p /opt && \
    # ajust permissions
    chown -R ${MY_USER}:${MY_USER} /opt && \
    chown -R ${MY_USER}:${MY_USER} /src

USER ${MY_USER}

RUN \
    cd /opt && \
    curl -s https://repo.anaconda.com/archive/Anaconda${ANACONDA_PYTHON_VERSION}-$ANACONDA_VERSION-Linux-x86_64.sh -o anaconda.sh && \
    echo "${ANACONDA_MD5}  anaconda.sh" > anaconda.md5 && \
    if [ $(md5sum -c anaconda.md5 | awk '{print $2}') != "OK" ] ; then exit 1; fi && \
    sh ./anaconda.sh -b -p ${ANACONDA_HOME} && \
    rm anaconda.sh anaconda.md5 && \
    echo ". ${ANACONDA_HOME}/etc/profile.d/conda.sh" >> /home/${MY_USER}/.bashrc && \
    echo "conda activate base" >> /home/${MY_USER}/.bashrc

RUN pip install --upgrade pip && \
    conda update conda -y

ENV \
    # TODO: think about using ${ANACONDA_HOME}/etc/profile.d/conda.sh
    PATH=${ANACONDA_HOME}/bin:${PATH}

ADD files/init-jupiter.sh /home/${MY_USER}
ADD files/init.sh /home/${MY_USER}

WORKDIR /home/${MY_USER}

ENTRYPOINT [ "./init.sh" ]
