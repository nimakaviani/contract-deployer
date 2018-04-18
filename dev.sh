#!/bin/bash
# geth --testnet removedb
geth --dev --datadir /root/datadir --rpc --rpcport 8545 --rpcaddr 0.0.0.0 --rpccorsdomain "*" --rpcapi "eth,net,web3,personal,miner,admin,txpool"
