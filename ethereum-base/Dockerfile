FROM ubuntu:latest

MAINTAINER Steven Bakhtiari

RUN apt-get update && \
    apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    add-apt-repository -y ppa:ethereum/ethereum-dev && \
    apt-get update && \
    apt-get -y install vim ethereum


