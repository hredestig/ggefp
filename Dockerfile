FROM ubuntu:trusty

RUN apt-get update
RUN apt-get -y install inkscape

COPY img/ /opt/img
COPY etc/ /opt/etc
WORKDIR /opt/etc
