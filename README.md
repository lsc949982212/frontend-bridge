



### Project title
Polymer lottery

### Team members
    lsc949982212

### Project Overview
Users can call my smart contract method, and then there is a certain probability of getting a lottery (LTT token), while gaining on Optimism and Base.

## 📋 Prerequisites

The repo is **compatible with both Hardhat and Foundry** development environments.

- Have [git](https://git-scm.com/downloads) installed
- Have [node](https://nodejs.org) installed (v18+)
- Have [Foundry](https://book.getfoundry.sh/getting-started/installation) installed (Hardhat will be installed when running `npm install`)
- Have [just](https://just.systems/man/en/chapter_1.html) installed (recommended but not strictly necessary)

You'll need some API keys from third party's:
- [Optimism Sepolia](https://optimism-sepolia.blockscout.com/account/api-key) and [Base Sepolia](https://base-sepolia.blockscout.com/account/api-key) Blockscout Explorer API keys
- Have an [Alchemy API key](https://docs.alchemy.com/docs/alchemy-quickstart-guide) for OP and Base Sepolia

Some basic knowledge of all of these tools is also required, although the details are abstracted away for basic usage.

## 🧰 Install dependencies

To compile your contracts and start testing, make sure that you have all dependencies installed.

From the root directory run:

```bash
just install
```

to install the [vIBC core smart contracts](https://github.com/open-ibc/vibc-core-smart-contracts) as a dependency.

Additionally Hardhat will be installed as a dev dependency with some useful plugins. Check `package.json` for an exhaustive list.

> Note: In case you're experiencing issues with dependencies using the `just install` recipe, check that all prerequisites are correctly installed. If issues persist with forge, try to do the individual dependency installations...

## ⚙️ Set up your environment variables

Convert the `.env.example` file into an `.env` file. This will ignore the file for future git commits as well as expose the environment variables. Add your private keys and update the other values if you want to customize (advanced usage feature).

```bash
cp .env.example .env
```

This will enable you to sign transactions with your private key(s). If not added, the scripts from the justfile will fail.

### Run-book
- Contract:
1. Install dependencies， compile code, deploy contract, you will get two addresses as port address.
```
    npx hardhat compile
    just deploy optimism base
```
2. Port address
    Optimism - Sepolia: 0x619859d90594231A4054C9ec1D2F0Fd9EC84CAB9
    Base - Sepolia: 0x60752A707553E31e2C0afBD815f90824Ee90525a
3. Copy abi from /artifacts/contracts/PolymerLottery.sol/PolymerLottery.json
4. Call `scratchLottery(address destPortAddr,bytes32 channelId)`

- Frontend:
1. polymer-lottery-frontend/src/config.js replace port address `OP_PORT_ADDRESS` and `BASE_PORT_ADDRESS` and replace `ABI`.
2. run frontend page `cd polymer-lottery-frontend && npm install && npm run start`


### Resources Used
- react.js
- bignumber.js
- web3.js
- antd
- hardhat
- @open-ibc/vibc-core-smart-contracts
### Challenges Faced
Since it is a cross-chain transaction, debugging must involve deploying the contract to the blockchain, which can be somewhat troublesome.

### Future Improvements
- Add listener for bridge
- improve the UI

### Testnet interaction
Optimism: [0x6a189b80bf3aa3707daee5c1ce23600add6b44a5915efe7ec93999d876813b91](https://optimism-sepolia.blockscout.com/tx/0x6a189b80bf3aa3707daee5c1ce23600add6b44a5915efe7ec93999d876813b91)
Base: [0x7e271d5689883b654fdb522c8aed0d703b5fdbbe45e54eaf089d702896ad7943](https://base-sepolia.blockscout.com/tx/0x7e271d5689883b654fdb522c8aed0d703b5fdbbe45e54eaf089d702896ad7943)


### PortAddress
Op: 0x619859d90594231A4054C9ec1D2F0Fd9EC84CAB9
Base: 0x60752A707553E31e2C0afBD815f90824Ee90525a

### Licence
[Apache 2.0](LICENSE)

