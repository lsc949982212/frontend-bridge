# PIT Phase 1 repo project: Polymer lottery

This repository is created to enter the PIT phase 1 challenge # 13.

## Team Members

- @lsc949982212 - Lead Developer

## Description

This application allows users to initiate a transaction from either OP or Base. Users of my channel have a certain probability of receiving a certain amount of ERC20 tokens, which can encourage users to use this contract.

Features:

- Uses Polymer x IBC as the cross-chain format
- Using my contract for cross-chain message sending, there is a certain probability of receiving token rewards.

## Resources used

The repo uses the [ibc-app-solidity-template](https://github.com/open-ibc/ibc-app-solidity-template) as starting point and adds custom contracts PolymerLottery that implement the custom logic.

The expected behaviour from the template should still work but nevertheless we quickly review the steps for the user to test the application...
Run `just --list` for a full overview of the just commands.

Additional resources used:
- Hardhat
- Blockscout
- react.js
- bignumber.js
- web3.js
- antd

## Steps to reproduce

After cloning the repo, install dependencies:

```sh
just install
```

And add your private key to the .env file (rename it from .env.example).

Check if the contracts compile:
```sh
just compile
```

1. Deploy contract, you will get two addresses as port address.
```
just deploy optimism base
```
2. Port address
    Optimism - Sepolia: 0x619859d90594231A4054C9ec1D2F0Fd9EC84CAB9
    Base - Sepolia: 0x60752A707553E31e2C0afBD815f90824Ee90525a
3. Copy abi from /artifacts/contracts/PolymerLottery.sol/PolymerLottery.json

- Frontend:
1. polymer-lottery-frontend/src/config.js replace port address `OP_PORT_ADDRESS` and `BASE_PORT_ADDRESS` and replace `ABI`.
2. run frontend page `cd polymer-lottery-frontend && npm install && npm run start`


## Proof of testnet interaction

After following the steps above you should have interacted with the testnet. You can check this at the [IBC Explorer](https://explorer.ethdenver.testnet.polymer.zone/).

Here's the data of our application:

- PolymerLottery (OP Sepolia) : 0x619859d90594231A4054C9ec1D2F0Fd9EC84CAB9
- PolymerLottery (Base Sepolia): 0x60752A707553E31e2C0afBD815f90824Ee90525a
- Channel (OP Sepolia): channel-10
- Channel (Base Sepolia): channel-11

- Proof of Testnet interaction:
    - [SendTx](https://optimism-sepolia.blockscout.com/tx/0x6a189b80bf3aa3707daee5c1ce23600add6b44a5915efe7ec93999d876813b91?tab=index)
    - [RecvTx](https://base-sepolia.blockscout.com/address/0x60752A707553E31e2C0afBD815f90824Ee90525a?tab=internal_txns)


### Challenges Faced
Since it is a cross-chain transaction, debugging must involve deploying the contract to the blockchain, which can be somewhat troublesome.

## What we learned

How to make the first dApp using Polymer.

### Future Improvements
- Add listener for bridge
- improve the UI

### PortAddress
Op: 0x619859d90594231A4054C9ec1D2F0Fd9EC84CAB9
Base: 0x60752A707553E31e2C0afBD815f90824Ee90525a

### Licence
[Apache 2.0](LICENSE)

