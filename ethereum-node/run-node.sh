#!/bin/bash

# Get this node's 'enode url'. Other nodes will use this to connect.
JS="'enode://' + admin.nodeInfo.id + '@' + '$(hostname -i):' + admin.nodeInfo.ports.discovery"
ENODE_URL=$(geth --datadir ./chain --exec "${JS}" console 2>/dev/null | sed -e 's/^"\(.*\)"$/\1/')

echo "Adding this node's  connection details to /tmp/nodes"
echo $ENODE_URL >> /tmp/nodes

# The following block will run every time a node is run for the first time. If
# docker-compose down is executed, then all files are removed and this will run
# again, as intended. If the containers are simply stopped or restarted using
# docker, then the following block will not run.
if [ ! -f ~/.intialised ]; then
    echo "First time running node..." 
    
    echo "Creating new account. See: ${PWD}/account.txt"
    geth --datadir ./chain --password ./account-password.txt account new > ./account.txt
    
    touch ~/.initialised
fi

# Load any node connection details, filtering out the details for this node.
while read -r LINE; do
    if [ ${LINE} != ${ENODE_URL} ]; then
        BOOTNODES="${LINE},${BOOTNODES}"
    fi
done < /tmp/nodes

echo "Starting geth with bootnodes: ${BOOTNODES%?}"

geth --datadir ./chain \
     --networkid 4827 \
     --password ./account-password.txt \
     --verbosity 5 \
     --bootnodes "${BOOTNODES%?}" \
     --rpc \
     --rpccorsdomain "*" \
     --nat "none" \
     --rpcapi "admin,eth,debug,miner,net,shh,txpool,personal,web3" \
     --mine \
     --minerthreads 1
