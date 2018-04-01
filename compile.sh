#!/bin/bash

contract=$1
echo "compiling contract $contract"

echo "var storageOutput=`solc --optimize --combined-json abi,bin,interface $contract`" > "$contract.js"
