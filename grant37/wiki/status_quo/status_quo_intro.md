## Current solutions to forever growing data in blockchains

A non-exhaustive list of ways to deal with the data growth issue is:
- *Compress data*: keep storing data as is but lower the impact / footprint of it.
- *Lower the number of full nodes in a blockchain*: make the number of nodes smaller in order to have less copies of the data distributed which lowers the synchronization requirements (to retain a high transaction speed) and limit the overall hardware needed to operate the full nodes.  This can be done by staking mechanisms and creating a set number of full nodes available in a chain.
- *Create a hierarchy of nodes*: split the blockchain functionality in components that together make up the full blockchain.
- *Shard the blockchain*: split the chain itself into smaller pieces that communicate through a single coordination chain

All of these solutions have their disadvantages and none of the solutions solve the basic problem.


