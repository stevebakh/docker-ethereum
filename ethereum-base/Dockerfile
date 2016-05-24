FROM ubuntu:latest

MAINTAINER Steven Bakhtiari

WORKDIR /opt/eth

COPY ./genesis-block.json .

RUN apt-get update && \
    apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    add-apt-repository -y ppa:ethereum/ethereum-dev && \
    apt-get update && \
    apt-get -y install vim ethereum solc

RUN geth --datadir ./chain init ./genesis-block.json
RUN mkdir -p ~/.ethash && geth --datadir ./chain makedag 0 ~/.ethash

