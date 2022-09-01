




<!-- ### Protocol

The protocol solving the storage and pruning challenge consists of the following : 
- The current state is kept locally and recalculated when new transactions come in, before spreading it out;
- Historical transactions are directly stored in QSFS, available for consultation and synchronisation purposes (in case new validators join). 
- The history is organised as one file system, which constitutes the data using chunks from different redundant shards, hosted on storage infrastructure of multiple independent hardware providers. Each of the shards contains insufficient information to recollect the original data, but using all shards combined allows to recollect the pieces with minimal overhead. 

#### Challenges and solutions to it

- Make sure that the data is sufficiently decentralized, i.e. spread over shards that are hosted on infrastructure of different providers. 
- Make sure that these 'shard hosters' keep the storage available, or that a sufficient amount of shards are recreated at a moment that shards become unavailable. The storage nodes need to remain alive. The consensus mechanism determines the need for incentivisation mechanisms. 
  - In a permissioned blockchain, using a Proof of Authority consensus driven blockchain, there is no real issue: here the participants have interest to have all history available, and no incentive is needed for them to make this happen. The QSS, in this case, is a way for participants to substantially reduce the need for space, remaining equally responsible for the history of transactions. 
  - In a permissionless blockchain, we need to find a mechanism to incentivize participants to keep also transaction history available, and even 'punish' node owners tricking the system, ex. retrieving the info by proxy-ing the service. A few ideas to cope with this issue : 
    - apply a higher-level protocol to interrogate the provider 
    - build into the protocol itself, and put the metadata on-chain

A node could be requested to provide a specific shard and hash it with a timestamp or specific nonce included, maybe running their own personalised 0-stor protocol instance.
The proof can be a merkle tree + root hash + a requested block, with the hash made based taking up a nonce/timestamp.-->

