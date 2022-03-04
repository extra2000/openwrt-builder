FROM docker.io/debian:buster

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical

USER root

RUN apt update && apt install -y \
    asciidoc \
    bcc \
    bin86 \
    build-essential \
    ccache \
    curl \
    ecj \
    fastjar \
    file \
    flex \
    gawk \
    gcc-multilib \
    gettext \
    git \
    help2man \
    intltool \
    java-propose-classpath \
    libboost-dev \
    libelf-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libssl-dev \
	libusb-dev \
    libxml-parser-perl \
    openjdk-11-jdk \
    python2.7 \
    python-dev \
    python3 \
    python3-dev \
    python3-distutils \
    python3-setuptools \
    rsync \
	sharutils \
    subversion \
    swig \
    unzip \
    wget \
    xsltproc \
    zlib1g-dev

RUN apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
