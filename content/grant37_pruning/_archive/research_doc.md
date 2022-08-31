# RESEARCH DOCUMENT DEVxDAO GRANT Proposal #37

## The problem: Forever growing data

Definition from the [wiki](https://en.wikipedia.org/wiki/Blockchain):
__"A blockchain is a growing list of records, called blocks, that are linked together using cryptography. Each block contains a cryptographic hash of the previous block, a timestamp, and transaction data (generally represented as a Merkle tree). The timestamp proves that the transaction data existed when the block was published in order to get into its hash. As blocks each contain information about the block previous to it, they form a chain, with each additional block reinforcing the ones before it. Therefore, blockchains are resistant to modification of their data because once recorded, the data in any given block cannot be altered retroactively without altering all subsequent blocks.__" 


Therefore blockchains by design create and carry historical data forever. The nature of a blockchain is that it stores data immutable and in an always append manner. So from the moment of inception of the blockchain (the "genesis" block) to the current point in time (the latest block) all data (blocks) ever created need to be stored on _and_ available on all participating (full) nodes.

This has profound implications for successful blockchains, regardless of their purpose. Whether the blockchain is a pure value transaction blockchain and stores value transations betweem wallets or it is a full blown smart contract
system storing a lot more data per contract, contract and contract execution results, it is all compounding to a forever growing storage requirement.

There are two main categories of blockchains, each with specific benefits and disadvantages: permission**less** and permission**ed** blockchains. The first allows anyone to take part and start contributing to the network, the latter having a (central) authority that agrees who can participate and who not. Both
type of blockchains have the same challange with regards to datastorage:  it is a forever growing chain of blocks which increases the storage needs of participating nodes indefinitely.

### Current solutions to the storage challenge

A non-exhaustive list of ways to deal with the data growth issue is:
- *Compress data*: keep storing data in the straighforward way but
  lower the impact / footprint of it.
- *Lower the number of full nodes in a blockchain*: make the number of nodes smaller in order to have less copies of the data distributed which lowers the synchronisation requirements and overall hardware needed.
- *Create a hierarchy of nodes*: split the blockchain functionality in components that together make up the full blockchain.

#### 1. Compress data

This is probably the most used method to solve the issue.  All participating (full) nodes compress the blocks created to minimize the data storage footprint. There are many compression algorithms available and depending on the specific type of blockchain hardware certain algorithms present better options than others.

##### SWOT analysis

*Strengths*
- simple to implement, plenty of compression algorithms available

*Weaknesses*
- it does not solve the issue, it postpones the issue becoming a problem.

*Opportunities*
- Quick to implement, quick to deploy.

*Threats*
- The storage problem will sooner or later appear. Choosing this solution will allow you to go to market quickly but then you have to hope that a solution will present itself before the issue will become a problem.

#### 2. Lower the number of full nodes in a blockchain

Full nodes refer to blockchain nodes that contain and have 100% of the chain history available online with a complete history intact, true and secure for the whole chain.  In order to control the quantity and quality of the nodes that make up the chain some project restrict participation to only known entities. This is often referred to as a "permissioned" chain.  A few _permissioned_ organisations (or people) are tasked to provide full nodes and deal with all the operational, security, scaling and realibility tasks.  This can be with and without a rewards for doing so.

Non-permissioned nodes can be allowed to alleviate some of the operational workload, but these nodes are not considered to be authorative for the true chain history. The true chain history is only provided by the (few) permissioned (full) chain nodes. This solution is chosen by protocol implementations to circumvent the problem by having node operators that commit to put the investment in to have proper node sizing. 

##### SWOT analysis

*Strengths*

- Efficient way of guaranteeing correct, secure and scalable chain operations

*Weaknesses*

- It steps away from the decentralisation idea a blockchain presents over traditional database solutions. The strength of a blockchain solution is that anyone can opt in to contribute and help to achieve security and safety.  By making blockchains permissioned the security and safety is lowered because the full nodes are operated by a set number of organisations and people.
- One node still has the full volume required, which makes running it and managing the issues around very big volumes still relevant. 


*Opportunities*

Create a governance structure around blockchain technology that is inline with the traditional IT industry and paradigms while still bringing forward the innovation achieved by blockchain technology.

*Threats*

Secure operations is threated by having a limited, known number of permissioned operators.  The form a set of single points of failure for the whole chains operations and security.

#### 3. Create a hierarchy of nodes

Another way to overcome this issue is to have a blockchain split the full chain process (workload) into subprocesses.  Each subprocess can now be worked on by specific type of nodes that are tailored to operate that one part of the process.  Examples are:
    - Transaction nodes: a node that only provides transaction capabilties and possibly store the results
    - Validaton nodes: nodes that look at the transaction nodes and validates transaction through some sort of consensus mechanism
    - Core/full nodes: nodes that store the full chain history and are authorative for chain content 
    - Edge nodes: remote nodes that perform edge transaction in a fast and efficient way.  There has to be some form of synchronisation between edge nodes and core/full nodes.

By creating different nodes type the requirements for storage per node (type) are lowered.

##### SWOT analysis 

*Strengths*
- provides independent scalability between different functions / processes off the full chain.

*Weaknesses*
- overhead is created by relying on the network to communicate between the different functions/subprocesses.  Network speed might effect overall performance on the chain 

*Opportunities*
- when required subprocesses can easily be broken up into smaller pieces when needed or vice versa integrated into large components.

*Threats*
- many different components have network interfaces and there are is a realistic chance that hackers might attack the network interfaces from the different nodes.

<!-- put an increasing demand on storage requirements for all participating nodes. This is not very sustainable and efficient.
The number of implementations of DAO's is going to be exponentially growing and there is a need for level-1 blockchain protocols to be able to deal with the increased volume of transactions and history where pruning is going to be needed. 
A blockchain is in essence a ledger of immutable records, which need to be combined to form an end ‘world state’. In order to obtain this world state, history needs to be kept as from genesys of the blockchain. 
Increase in volume and transactions creates issues at some point in time, with a ledger that becomes too big for a decent synchronisation. 
-->

### Examples of well known chains and their sizes

- [Stellar](https://developers.stellar.org/docs/run-core-node/prerequisites/)
- [Ethereum](https://decrypt.co/24779/ethereum-archive-nodes-now-take-up-4-terabytes-of-space)
- [blockchain size article](https://101blockchains.com/blockchain-size/)
  

<!-- Solution => see solution_description.md -->