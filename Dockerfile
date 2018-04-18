FROM ubuntu:latest
# Get the Ethereum Stuffs
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y build-essential git
RUN add-apt-repository ppa:longsleep/golang-backports
RUN add-apt-repository ppa:ethereum/ethereum
RUN apt-get update
RUN apt-get install -y ethereum
RUN apt-get install -y solc
RUN apt-get install -y golang-go
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN git clone https://github.com/ethereum/go-ethereum
WORKDIR /go-ethereum
RUN make geth
WORKDIR /

RUN npm install --production --quiet cli-flags
RUN npm install --production --quiet web3
RUN npm install --production --quiet solc

# House the data here
RUN mkdir /block-data
ADD testnet /block-data
RUN rm -rf /block-data/keystore

# Pass in the genesis block. 
RUN mkdir /code
RUN cd /code
COPY GenesisBlock.json code/GenesisBlock.json
COPY ropsten.sh code/ropsten.sh
COPY pusher.js code/pusher.js
COPY blockchain.sh code/blockchain.sh
COPY simple.sol code/simple.sol
RUN ln -sf /go-ethereum/build/bin/geth /bin/geth
EXPOSE 22 8088 50070 8545
RUN chmod +x code/ropsten.sh
RUN chmod +x code/pusher.js
