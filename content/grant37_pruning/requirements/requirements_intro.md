
## Requirements Introduction

A blockchain is in essence a ledger of immutable records that are always append and therefore linked and a chain, The total chain forms the "end state". In order to proof validity of this end state, the complete history needs to be kept from the genesis time of the blockchain to now. 

Blockchains enable organizations to run decentralized, they allow value transaction to be done without a third party in the middle and any other use case of blockchain technology always revolves around decentralization.  The permissionless blockchain provide the most pure form of decentralization where node owners and operators decide for themselves whether the reward for operating a node is sufficient for them to get involved (or not).  Permissioned blockchains have a slightly less decentralized character but certainly have a distributed character where the reward is not just governed by an algorithm because here there might be a legal entity involved to orchestrate the rewards system.  This  legal entity might be a DAO (Distributed Autonomous Organization).

The number and types of implementations of blockchains (supporting the growth in adoptions for traditional use cases and  DAO's) is going to grow exponentially, there is a need for level-1 blockchain protocols to be able to deal with the increased volume of transactions and history, making pruning a necessity.

Increase in data volume and transactions volume will create issues at some point in time, a ledger holding the complete chain data will become too big for a key aspects of a blockchain:

- fast transaction times require minimum synchronization time.
- security and proof of validity requires the complete chain to be stored many times over to overcome a 51% attack
- decentralized operations is key but operating a full nodes becomes more expensive by excessive chain data growth which in the long run will rule out people that do not have the means to afford such hardware.

All of the above threatens the decentralization of any layer-1 blockchain project in general.

From the literature researched we formed ideas how we can come to a "non intrusive" pruning system for regular blockchain protocols without necessarily make major changes to the existing blockchain and consensus algorithms. To form such a solution there are a number of technology components that will make creating such a solution possible or easier to create.  To architect methods to solve this problem we have opted to use the ThreeFold data processing and storage stack which presents a unique decentralized utility / cloud platform with some unique storage capabilities that will make developing this solution possible.
