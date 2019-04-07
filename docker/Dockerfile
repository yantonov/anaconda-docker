FROM ubuntu:16.04

MAINTAINER Yury Antonov <yantonov@yandex.ru>

RUN apt-get update && apt-get install -y \
    curl \
    bzip2

ENV ANACONDA_VERSION 2019.03
ENV ANACONDA_MD5 43caea3d726779843f130a7fb2d380a2

RUN curl -s https://repo.continuum.io/archive/Anaconda3-$ANACONDA_VERSION-Linux-x86_64.sh -o anaconda.sh && \
    echo "${ANACONDA_MD5}  anaconda.sh" > anaconda.md5 && \
    if [ $(md5sum -c anaconda.md5 | awk '{print $2}') != "OK" ] ; then exit 1; fi && \
    mkdir -p /opt && \
    sh ./anaconda.sh -b -p /opt/conda && \
    rm anaconda.sh anaconda.md5

ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

CMD [ "bash" ]
