#!/bin/bash

# nohup ./ropsten.sh & 2>&1 >/dev/null &
# pid=$?
# echo $pid
#
# sleep 2
#
# password=$(date +%s | sha256sum | base64 | head -c 32 ; echo)
# geth account new --password <(echo $password)
#
eth_data=$(geth --testnet account list | grep Account | cut -d" " -f 4 | cut -c 12- | xargs cat)
echo $eth_data
export ETH_DATA=$eth_data

