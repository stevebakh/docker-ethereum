#!/bin/bash

if [ ! -f ./account.txt ]; then
    echo "First time running node, creating new account. See: ${PWD}/account.txt"
    geth --datadir ./chain --password ./account-password.txt account new > ./account.txt
fi

geth --datadir ./chain \
     --networkid 4827 \
     --password ./account-password.txt \
     --verbosity 5 \
     --rpc \
     --rpccorsdomain "*" \
     --nat "none" \
     --rpcapi "admin,eth,debug,miner,net,shh,txpool,personal,web3" \
     --mine \
     --minerthreads 1 \
     --identity ${NODE_NAME} \
     --nodiscover
