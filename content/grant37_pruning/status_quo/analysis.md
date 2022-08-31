

# Analysis

The current solutions to the forever growing data storage requirements to not tackle the real problem: How can we prune a (any) blockchain protocol without putting limitations and restrictions on the protocol itself but provide a storage utility that is trustworthy and builds on the principles provided by the blockchain protocol without changing them?

## Current solutions to forever growing data in blockchains

A non-exhaustive list of ways to deal with the data growth issue is:
- *Compress data*: keep storing data as is but lower the impact / footprint of it.
- *Lower the number of full nodes in a blockchain*: make the number of nodes smaller in order to have less copies of the data distributed which lowers the synchronization requirements (to retain a high transaction speed) and limit the overall hardware needed to operate the full nodes.  This can be done by staking mechanisms and creating a set number of full nodes available in a chain.
- *Create a hierarchy of nodes*: split the blockchain functionality in components that together make up the full blockchain.
- *Shard the blockchain*: split the chain itself into smaller pieces that communicate through a single coordination chain

All of these solutions have their disadvantages and none of the solutions solve the basic problem.

## blockchain sharding

The practice of splitting a blockchain into multiple segments is known as sharding. This feature is planned for Ethereum 2.0 and is already live on the Zilliqa network. Sharding is presented as an emerging solution to the blockchain trilemma.

| *Strengths* |
| :------------ | 
| Reduces both the storage and computational load of nodes securing each shard, thus improving scalability and decentralization. Could provide better security than multichain ecosystems which appear to have a similar structure. |

| *Weaknesses* |
| :------------ | 
| Sharding is still an experimental technology with limited testing. Adding sharding to an existing blockchain requires significant changes to the protocol itself. |


| *Opportunities* |
| :------------ | 
| If successful, sharding can be a powerful feature and may find wide adoption among blockchains. Node operators on these chains still stand to benefit from distributed archiving of their shard. | 

| *Threats* |
| :-----------|
| This is a complex addition to a protocol that comes with certain tradeoffs and adds additional attack surface. |


## Lower the number of full nodes in a blockchain

Full nodes refer to blockchain nodes that contain and have 100% of the chain history available online with a complete history intact, true and secure for the whole chain.  In order to control the quantity and quality of the nodes that make up the chain some project restrict participation to only known entities. This is often referred to as a "permissioned" chain.  A few _permissioned_ organizations (or people) are tasked to provide full nodes and deal with all the operational, security, scaling and reliability tasks.  This can be with and without a rewards for doing so.

Non-permissioned nodes can be allowed to alleviate some of the operational workload, but these nodes are not considered to be authoritative for the true chain history. The true chain history is only provided by the (few) permissioned (full) chain nodes. This solution is chosen by protocol implementations to circumvent the problem, by having node operators that commit to put the investment in to have proper node sizing. 

**SWOT analysis**

| *Strengths* |
| :------------| 
| Efficient way of guaranteeing correct, secure and scalable chain operations |

| *Weaknesses* |
| :------------| 
| It steps away from the decentralization benefit a blockchain presents over traditional database solutions. The strength of a blockchain solution is that anyone can opt in to contribute and help to achieve security and safety. By making blockchains permissioned the security and safety is lowered because the full nodes are operated by a set number of organizations and people |
| One node still has the full volume required, which makes running it and managing the issues around very big volumes still relevant. |

| *Opportunities* |
| :------------| 
| Create a governance structure around blockchain technology that is in line with the traditional IT industry and paradigms while still bringing forward the innovation achieved by blockchain technology. |s

| *Threats* |
| :------------| 
| Secure  operations is threated by having a limited, known number of permissioned operators. The form a set of single points of failure for the whole chains operations and security. |


## Compress data

This is probably the most used method to solve the issue. All participating archival nodes compress the blocks created to minimize the data storage footprint. There are many compression algorithms available and depending on the specific type of blockchain hardware certain algorithms present better options than others.

**SWOT analysis**

| *Strengths* |
| :------------| 
| Simple to implement, plenty of compression algorithms available |

| *Weaknesses* |
| :------------| 
| it does not solve the issue, it postpones the issue becoming a problem.|

| *Opportunities* |
| :------------| 
| Quick to implement, quick to deploy.|

| *Threats* |
| :------------| 
| The storage problem will sooner or later appear. Choosing this solution will allow you to go to market quickly but then you have to hope that a solution will present itself before the issue will become a problem.

## A hierarchy of nodes

Another way to overcome this issue is to have a blockchain split the full chain process (workload) into subprocesses. Each subprocess can now be worked on by specific type of nodes that are tailored to operate that one part of the process.  Examples are:
  - Transaction nodes: a node that only provides transaction capabilities and possibly store the results
  - Validator nodes: nodes that look at the transaction nodes and validates transaction through some sort of consensus mechanism
  - Core/full nodes: nodes that store the full chain history and are authoritative for chain content 
  - Edge nodes: remote nodes that perform edge transaction in a fast and efficient way.  There has to be some form of synchronization between edge nodes and core/full nodes.

By creating different nodes type the requirements for storage per node (type) are lowered.

**SWOT analysis** 

| *Strengths* |
| :------------ | 
provides independent scalability between different functions / processes off the full chain.|

| *Weaknesses* |
| :------------ | 
| Overhead is created by relying on the network to communicate between the different functions/subprocesses. Network speed might effect overall performance on the chain |


| *Opportunities* |
| :------------ | 
| when required subprocess's can easily be broken up into smaller pieces when needed or vice versa integrated into large components.| 

| *Threats* |
| :-----------|
| Many different components have network interfaces and there are is a realistic chance that hackers might attack the network interfaces from the different nodes.|

## A new way how to store data using forward looking correcting codes

This is what ThreeFold has been working on for a long time, the original solution was created by our team back in 2012 and was part of an exit of 300m USD. The software we have today is a completely new version and is even faster and more scalable.

