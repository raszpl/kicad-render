FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG VERSION=no-version

ENV VERSION=$VERSION

RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:kicad/kicad-dev-nightly && \
    apt-get install kicad-nightly ffmpeg -y && \ 
    rm -rf /var/lib/apt/lists/*

COPY *.sh /usr/bin/

RUN chmod a+rx /usr/bin/render-pcb.sh && chmod a+rx /usr/bin/kicad_animation.sh

WORKDIR /pwd