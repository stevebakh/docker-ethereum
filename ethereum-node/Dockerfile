FROM substrate/ethereum-base

MAINTAINER Steven Bakhtiari

ENV NODE_NAME ethnode

COPY ./genesis-block.json .
COPY ./account-password.txt .

RUN geth --datadir ./chain init ./genesis-block.json
RUN geth --datadir ./chain --password ./account-password.txt account new > ./account.txt

CMD geth --datadir ./chain --networkid 4827 --password ./account-password.txt \
         --rpc --rpcaddr "0.0.0.0" --rpccorsdomain "*" \
         --rpcapi "admin,eth,debug,miner,net,shh,txpool,personal,web3" \
         --mine --minerthreads 1 --identity ${NODE_NAME}

