# contract-deployer

This repo is for making a docker image for the blockhead broker to deploy.

The image is structured to have several dependencies all together for rapid deployment.

The main entrypoint is a copy of go-ethereum to run a geth node.

A secondary entrypoint called `pusher.js` is used to talk to the geth node as it runs, to deploy and execute contracts.
To do the communication, we use web3.js. This is node.js so we have a copy of node.
