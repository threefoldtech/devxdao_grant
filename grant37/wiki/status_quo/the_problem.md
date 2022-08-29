# The problem: Forever growing data

Definition from the [wiki](https://en.wikipedia.org/wiki/Blockchain):
__"A blockchain is a growing list of records, called blocks, that are linked together using cryptography. Each block contains a cryptographic hash of the previous block, a timestamp, and transaction data (generally represented as a Merkle tree). The timestamp proves that the transaction data existed when the block was published in order to get into its hash. As blocks each contain information about the block previous to it, they form a chain, with each additional block reinforcing the ones before it. Therefore, blockchains are resistant to modification of their data because once recorded, the data in any given block cannot be altered retroactively without altering all subsequent blocks.__" 

Therefore blockchains by design create and carry historical data forever. The nature of a blockchain is that it stores data immutably and in an always-append manner. So from the moment of inception of a blockchain (the "genesis" block) to the current point in time (the latest block) all data (blocks) ever created need to be stored on _and_ available on a sufficient set of (full) nodes to ensure the life of the chain.

This has profound implications for successful blockchains, regardless of their purpose. Whether the blockchain is a pure value transaction blockchain or it is a smart contract system with additional data storage requirements, it is all compounding to a forever growing storage requirement. To the extent that the data grows faster than the storage purchasing power of node operators, this becomes a centralizing force as fewer network participants can afford to host the whole chain.

There are two main categories of blockchains, each with specific benefits and disadvantages: permission**less** and permission**ed** blockchains. The first allows anyone to take part and start contributing to the network, the latter having a (central) authority that agrees who can participate and who not. Both types of blockchains have the same challenge with regards to data storage: it is a forever growing chain of blocks which increases the storage needs of participating nodes indefinitely, but pruning solutions are very different because of the following:
- in a permission**less** blockchain anyone can choose to participate to help to run and secure the blockchain by operating a blockchain node.  Consensus and trust is based on an algorithm, not on any central authority.
- in a permission**ed** blockchain there is a central authority of some sort that allows blockchain nodes to be added to the network.  The central authority provides trust and to a degree consensus.

So the blockchain pruning challenge is many times larger for permission**less** chains then for permission**ed** chains.

## Evidence of the problem statement

Overview (not exhaustive) of what the current blockchains experience in terms of data growth and the challenges that come with it at the current state of play of blockchain projects:
- [Stellar](https://developers.stellar.org/docs/run-core-node/prerequisites/)
- [Ethereum](https://decrypt.co/24779/ethereum-archive-nodes-now-take-up-4-terabytes-of-space)
- [blockchain size article](https://101blockchains.com/blockchain-size/)

Reading through these articles we can find chain size growth figures of 50x over a period of 2 years. And with the exponential growth and adoption of blockchain technologies this is a real problem that lies ahead of us which is not going to be solved by the rate of which hardware is improving and becoming more affordable.



|