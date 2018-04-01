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
RUN git clone https://github.com/ethereum/go-ethereum
WORKDIR /go-ethereum
RUN make geth
WORKDIR /
# House the data here
RUN mkdir /block-data
# Pass in the genesis block. 
COPY GenesisBlock.json GenesisBlock.json
COPY ropsten.sh ropsten.sh
COPY blockchain.sh blockchain.sh
COPY contract.sol contract.sol
RUN ln -sf /go-ethereum/build/bin/geth /bin/geth
EXPOSE 22 8088 50070 8545
RUN chmod +x ropsten.sh
RUN touch /.firstrun
# ENTRYPOINT ["/ropsten.sh"]
# CMD ["/bin/bash", "-c", "source wrapper.sh"]
