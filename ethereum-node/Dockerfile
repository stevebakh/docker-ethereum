FROM substrate/ethereum-base

MAINTAINER Steven Bakhtiari

ENV NODE_NAME ethnode

WORKDIR /opt/eth

COPY ./genesis-block.json .
COPY ./account-password.txt .
COPY ./run-node.sh .

RUN chmod a+x ./run-node.sh
RUN geth --datadir ./chain init ./genesis-block.json
RUN mkdir -p ~/.ethash && geth --datadir ./chain makedag 0 ~/.ethash

CMD ./run-node.sh

