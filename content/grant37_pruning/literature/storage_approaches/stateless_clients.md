

### Stateless clients, sharding, and scalability

Ethereum's Vitalik Buterin has written extensively on the problem of blockchain scalability and the importance of keeping node operation accessible for the health of blockchain networks. He [proposes](https://ethresear.ch/t/the-stateless-client-concept/172) that beyond pruning the chain, nodes might not need to store any state at all to validate blocks and help secure the network.

[Sharding](https://vitalik.ca/general/2021/04/07/sharding.html) is the approach being taken to improve scalability of Ethereum in it's 2.0 version. This post explains how sharding can be more secure than simply linking multiple chains in a blockchain ecosystem.

"[The Limits to Blockchain Scalability](https://vitalik.ca/general/2021/05/23/scaling.html)" details reasons why making node operation accessible is important for chain security. Includes an analysis of what realistic hardware limits are for node operators before becoming too great of an investment to discourage general participation.

A highly resilient chain archiving mechanism would help especially in the case described below:

*This is all even more important during an attack, when a successful response to the attack will likely involve many users spinning up new nodes when they were not running nodes before.*
