<!-- :female_detective: Looking for a new champion -->

# Dappnode Package _Web3Signer_

<!--DAppNode package logo (could be added with a hyperlink to a youtube video): -->

![](node-avatar.png)

<!--Brief introduction about the source project (official project definition is an option): -->

A validator client contributes to the Consensus Layer of the Ethereum blockchain by signing proposals and attestations of blocks, using a BLS private key which must be available to this client at all times.

The BLS remote signer API is designed to be consumed by validator clients, looking for a more secure avenue to store their BLS12-381 private key(s), enabling them to run in more permissive and scalable environments.

More information about the EIP can be found at [the official website](https://eips.ethereum.org/EIPS/eip-3030)

### Why use the _Web3Signer_ ?

<!--What can you do with this package?: -->

Client diversity is a key goal in Dappnode, you will be able to use different clients and do not deposit all the trust on just one of them. It can also work as a load balancer, keeping your validators always validating, and also helps protect your keys and slashing database by storing your signing keys in just this remote signer, so that when switching client's locally you dont need to transfer Slashing Protection DBs, or your keystores between the 5 Consensus Layer Clients.  The Web3Sginer is the most battle tested remote signer out there, which is geared towards institutional usage which demands the most rigorous security and audits.

### Requirements

Rquirements to run the Dappnode Package for the Web3Signer

<!--Requirements to run the Dappnode package in a list: -->

- **A Validator**: Generate a validator(s) _offline_ using [Wagyu](https://github.com/stake-house/wagyu-key-gen/releases) (Easiest way to generate keystores for validators all GUI Program no command line needed), or the [Official Staking Deposit CLI](https://github.com/ethereum/staking-deposit-cli/releases), (needs basic CLI knowledge) Then fund your validator at with the [Official Staking Launchpad](https://launchpad.ethereum.org/en/)
- **Ethereum Execution Client**: you should have installed and synced an Execution Layer Client (i.e. Besu, Erigon, Geth, or Nethermind).
- **Ethereum Consensus Client**: you should have installed and synced a Consensus Layer Client (i.e. Lighthouse, Lodestar, Nimbus, Prysm, or Teku).

### Manteinance

<!--Table with champion/s mantainers, versions and update status -->
<!--UPDATED: :x: OR :heavy_check_mark: -->

|      Updated       |   Champion/s   |
| :----------------: | :------------: |
| :heavy_check_mark: | @pablomendez95 |

### Development

Build a development binary of the Web3Signer. Also uses the latest postgresql scripts defined at https://github.com/ConsenSys/web3signer/tree/master/slashing-protection/src/main/resources/migrations/postgresql

```
npx @dappnode/dappnodesdk build --compose_file_name=docker-compose.dev.yml
```
