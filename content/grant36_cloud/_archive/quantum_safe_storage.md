### Solution
  
The number of implementations of DAO's is going to be exponentially growing and there is a need for level-1 blockchain protocols to be able to deal with the increased volume of transactions and history where pruning is going to be needed. 
A blockchain is in essence a ledger of immutable records, which need to be combined to form an end ‘world state’. In order to obtain this world state, history needs to be kept as from genesys of the blockchain. 
Increase in volume and transactions creates issues at some point in time, with a ledger that becomes too big for a decent synchronisation. 

ThreeFold Tech has developed the technology to store immutable records in a more space efficient way, relying on a fully decentralised grid of storage capacity. 
No participant has the full storage volume on his hard drive, however the combination of all participants allows recomposing of the full ledger with all records. This method brings many benefits: 
- The storage happens in a very, quantum-resilient way, as attacking one chunk gives insufficient information to recreate the authentic data;
- Storage grows slower over time compared to a classic blockchain setup, as storage overhead can be limited to about 20% instead of the ‘traditional’ 10000% (in the case of 100 participants running a blockchain node) overhead;
- It allows for an easy way to implement pruning: only the current state is really required to be stored locally, and when transactions come in, a recalculation is made, and the storing of the historical transactions is directly done using QSFS

### What is QSFS ? 

QSFS stands for Quantum-Safe File System. 
It is a redundant filesystem, which can store petabytes of information.

Unique features are : 
- Unlimited scalable (many petabytes) filesystem
- Data is spread over many devices owned by different, independent hardware owners called farmers. Together, these farmers provide the capacity to a hardware grid, call the ThreeFold Grid. 
- Dispersion over multiple sites ensures 100% privacy of the data, as no farmer knows what the data is about. Even a quantum computer cannot decrypt the data when attacking a node, as one node contains insufficient information to unambiguously recreate the authentic data.
- Data can’t be lost: there is a protection for datarot, data will auto-repair.
- Data is append-only and immutable by design of the protocol, so it’s fit for storing ledger history. Even with sites going down, data is not lost with ‘operational’ backup nodes in place.
- Up to 10x more efficient than storing on classic storage cloud systems. Overhead of about 20% is sufficient to have a secure archive.
- Can be mounted as filesystem on any OS or any deployment system (OSX, Linux, Windows, Docker, Kubernetes, TFGrid, ...).
- It is compatible with +/- all data workloads (exception: high performance data driven workloads like a database).
- Self-healing: when node or disk lost, storage system can get back to original redundancy level
Helps with compliance to regulations like GDPR (as the hosting facility has no view on what is stored, information is encrypted and incomplete).
- Hybrid : can be installed onsite, public, private, ...
- Read-write caching on encoding node (the front end).

### Components

#### 0-db storage engine

This is an always-append database, which stores objects in an immutable format, which allows to have history out-of-the-box, good performance on disk, low overhead, easy data structure, easy backup (linear copy and immuable files).
We use two types of 0-db: 
- One for the storage backend 
- One for 0-db-fs, which is where data needs to be, to be available via the fuse filesystem. This 0-db can offload its data to an external process (user-defined) and can also request missing data to be retrieved, if some data are missing.

This enables the database to spread and not always use local storage space if data is not read.

One external process to handle these cases is 0-stor-v2.

#### 0-db-fs FUSE layer which uses the storage engine in an optimized way

This is a simple filesystem driver which uses 0-db as the primary storage engine.
Directories and metadata are stored in a dedicated namespace, file payloads are saved in another dedicated namespace.
The filesystem uses an internal cache system made, not for performance, but to optimize how data is stored in the 0-db, to avoid overhead as much as possible.

#### 0-stor-v2 engine to save/backup data to safe location

This tool can be used as external process for 0-db, or can be used for any purpose. It just takes one file as input, it encrypts this file in AES based on a key user-defined, encodes the file and spreads the data to multiple 0-db’s. Based on the policy (configurable), some amount of 0-db’s can be unreachable, data can still retrieved and missing database can even be rebuilt to keep full consistency available.

Metadata needed to get data back from 0-db in the right order, are stored in others 0-db.

### Protocol

The protocol solving the storage and pruning challenge consists of the following : 
- The current state is kept locally and recalculated when new transactions come in, before spreading it out;
- Historical transactions are directly stored in QSFS, available for consultation and synchronisation purposes (in case new validators join). 
- The history is organised as one file system, which constitutes the data using chunks from different redundant shards, hosted on storage infrastructure of multiple independent hardware providers. Each of the shards contains insufficient information to recollect the original data, but using all shards combined, there is a way to recollect the origin

#### Challenges and solutions to it

- Make sure that the data is sufficiently decentralized, i.e. spread over shards that are hosted on infrastructure of different providers. 
- Make sure that these 'shard hosters' keep the storage available, or that a sufficient amount of shards are recreated at a moment that shards become unavailable. The storage nodes need to remain alive. The consensus mechanism determines the need for incentivisation mechanisms. 
  - In a permissioned blockchain, using a Proof of Authority consensus driven blockchain, there is no real issue: here the participants have interest to have all history available, and no incentive is needed for them to make this happen. The QSS, in this case, is a way for participants to substantially reduce the need for space, remaining equally responsible for the history of transactions. 
  - In a permissionless blockchain, we need to find a mechanism to incentivize participants to keep also transaction history available, and even 'punish' node owners tricking the system, ex. retrieving the info by proxy-ing the service. A few ideas to cope with this issue : 
    - apply a higher-level protocol to interrogate the provider 
    - build into the protocol itself, and put the metadata on-chain

A node could be requested to provide a specific shard and hash it with a timestamp or specific nonce included, maybe running their own personalised 0-stor protocol instance.
The proof can be a merkle tree + root hash + a requested block, with the hash made based taking up a nonce/timestamp.