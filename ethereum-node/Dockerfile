FROM substrate/ethereum-base

MAINTAINER Steven Bakhtiari

WORKDIR /opt/eth

COPY ./account-password.txt .
COPY ./run-node.sh .

RUN chmod a+x ./run-node.sh

CMD ./run-node.sh

