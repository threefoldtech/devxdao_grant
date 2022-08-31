# Requirements

>TODO: needs to be broken appart in multiple files, use some tables, ...

>TODO: think more what do we want to achieve adn putrequirements as such

A blockchain is in essence a ledger of immutable records that are always append and therefore linked and a chain, The total chain forms the "end state". In order to proof validity of this end state, the complete history needs to be kept from the genesis time of the blockchain to now. 

Blockchains enable organizations to run decentralized, they allow value transaction to be done without a third party in the middle and any other use case of blockchain technology always revolves around decentralization.  The permissionless blockchain provide the most pure form of decentralization where node owners and operators decide for themselves whether the reward for operating a node is sufficient for them to get involved (or not).  Permissioned blockchains have a slightly less decentralized character but certainly have a distributed character where the reward is not just governed by an algorithm because here there might be a legal entity involved to orchestrate the rewards system.  This  legal entity might be a DAO (Distributed Autonomous Organization).

The number and types of implementations of blockchains (supporting the growth in adoptions for traditional use cases and  DAO's) is going to grow exponentially, there is a need for level-1 blockchain protocols to be able to deal with the increased volume of transactions and history, making pruning a necessity.

Increase in data volume and transactions volume will create issues at some point in time, a ledger holding the complete chain data will become too big for a key aspects of a blockchain:
- fast transaction times require minimum synchronization time.
- security and proof of validity requires the complete chain to be stored many times over to overcome a 51% attack
- decentralized operations is key but operating a full nodes becomes more expensive by excessive chain data growth which in the long run will rule out people that do not have the means to afford such hardware.

All of the above threatens the decentralization of any layer-1 blockchain project in general.

From the literature researched we formed ideas how we can come to a "non intrusive" pruning system for regular blockchain protocols without necessarily make major changes to the existing blockchain and consensus algorithms. To form such a solution there are a number of technology components that will make creating such a solution possible or easier to create.  To architect methods to solve this problem we have opted to use the ThreeFold data processing and storage stack which presents a unique decentralized utility / cloud platform with some unique storage capabilities that will make developing this solution possible.

## Solution architecture

To honor decentralization aspect the of any chain data the pruning solution cannot be governed or owned by one (or a few) legal entities, it has to follow the same principle of being permissionless or somehow permissioned with a DAO governing the permissioned aspects. 

To make this work we have to create a set of requirements to what the solution needs to be designed to.

### High level requirements

In order to start looking at solutions let's first draft some requirement that we believe are instrumental to the solution.  The requirements are:

1. pruning solution should be able to run *on* node as well as *off* node by using largely the same method and software.
2. the pruning solution should be able to work using the blockchain nodes local storage capacity only and store de-duplicated chain data on these nodes resulting in an over all lower amount of total disk space usage used for all `N` nodes _or_ it should use a trusted storage facility that uses external storage capacity to store de-duplicated chain data and is (possibly) governed by a DAO.
3. 2the pruning solution should store the chain data such that it provides a proof of recovery method 
4. the pruning solution should transport data (by network) *off* node in such a way that it cannot be stopped by entities (read ISP's, governments and other legal entities)
5. the pruning solution should allow node operators to *opt in* and *opt out* of using it.


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

### Necessary conditions.

Taking the high level requirements into consideration we take the following necessary conditions on board to design the solution:

**Necessary Condition 1 (NC1)**. *Secure, autonomous, decentralized and distributed data processing and storage utility*

To create autonomous, decentralized and distributed data processing and storage utility we need an operating system that provides maximum security by not allowing people to give it instructions or configure it.  To reach a distributed and decentralized grid of processing and storage capacity we cannot rely on people to install and operate standard operating systems.  A standard operating system would allow individual owners of these nodes to be able to see (and potentially manipulate) the incoming data parts to be stored.

ThreeFold has developed such an operating system that gets its instructions from a decentralized ledger where a smart contract governs the execution of such operational instructions.  Such an operating system would allow the compute and storage nodes involved in the pruning solution to be safe, private, sovereign and autonomous  in it's operations.

**Necessary condition 2 (NC2)**. *Immutable and always-append storage device*

Use a low level storage device that uses physical storage similar to how a blockchain create chain data: always append and immutable.  When data is committed to this storage device it cannot be deleted.  The data is committed and stored on this storage device for as long as this device is part of the storage system for pruned data.

**Necessary condition 3 (NC3)**. *Encrypted secure networking*

<!--  (maybe to be deleted, as there's not really data to secure when pruning) -->

Use secure and encrypted networking between the blockchain nodes and the *remote* storage utility.  Chain data needs to be transported off node and we need to have certainty that data cannot be changed or messed with in the transport part of the pruning process. Therefore encrypted networking using an overlay network technology is an important component for taking chain data off blockchain nodes.

**Necessary condition 4 (NC4)**. *A filesystem that presents remote storage to blockchain node*

For minimal to no impact to general blockchain nodes, the off-node storage utility should be presenting itself on the blockchain node as a normal filesystem.  All activities of storing data away from the blockchain node and creating the necessary proof points along the way should require minimal to no impact on the blockchain software.  Proof point should include:
- authenticity of being pruned from a particular node
- comparing off chain data from different nodes to contain the same data
- de-duplicating data   
- other activities to condense the data footprint and make the whole blockchain more efficient and scalable

Some blockchain protocols have built in capabilities that allow partial backup of chain data and provide the required proof of the authenticity of the partial backup which makes the remote storage filesystem an ideal way to take data off-node.

**Necessary condition 5 (NC5)** . *Secure access to remote stored and de-duplicated data*

Provide secure access to the stored history of the chains and make all nodes (ideally) use de-duplicated copies of the historic data.

**Necessary condition 6 (NC6)**. *Proof of recoverability*

When data is stored off node in a de-duplicated format there should be a regular check if the pruned data is recoverable.  This necessary condition will also create the opportunity for new nodes to join at and start validating and securing from the current chain state while in the background cycling back the the genesis block on the pruned chain data and create proof of recoverability for the while chain. 

## Solution components

To fullfil the necessary conditions mentioned earlier there are a number of components in the ThreeFold technology stack that meet these condition and will be considered to be part of the pruning solution.  Here is a brief description of how components meet the conditions.

### NC1: Secure and autonomous Operating System

The principles to build a secure and autonomous operating system to build a decentralized and distributed grid of capacity are as follows:

- *Autonomy*: to create compute, storage and networking capacity everywhere you can not rely on a remote (or a local) maintainer of the operating system. Also owners should not have to be operating system administrators.  By making the OS autonomous and not allowing owners or systems administrators to log in to the OS you make it a very secure operating system.
- *Simplicity*: An operating system should be simple, able to exist anywhere, for anyone, good for the planet.  Simplicity also enhances the overall security of a system 
- *Stateless*: In a grid (Peer To Peer) set up, the sum of the components is providing a stable basis for single elements to fail and not bring the whole system down. Therefore, it is necessary for single elements to be stateless, and the state needs to be stored within the grid.  

<img src="./img/threefold__zero_os_overview.jpg" alt="threefold_zero_os_overview" width="800"/>

Building an autonomous, simple and stateless OS is not an easy feat.  Not having access means that is has to be 100% right at time of deployment.  Zero-OS has been developed and improved over the last 5 years and is now ready to be the capacity generator for secure IT workloads where compute, storage and networking components interact.

### NC2: Immutable and always-append storage protocol

In such an autonomous operating system storing data can be done in a very secure manner.  As owners, administrators and users do not have direct access to the operating system a very secure environment is created to run applications and store data.  Also since this operating system is made to form a grid creating ubiquitous compute, storage and network utility local storage devices can be used to make a "dispersed" storage system.

At the foundation of such a dispersed storage system sits a zero-DB.
Zero-db is a fast and efficient key-value store (redis-protocol compatible), which makes data persistent inside an always append data file, with namespaces support.  This zero-DB is able to receive and send information over a secure network that spans between all the zero-OS's and as such many zero-DB's can together create a large storage lake.

The Zero-DB stores data like a key-value store, and can operate (when configured to do so) to store data sequentially which makes it an "always append" storage device.  For caching purposes it can also be configured to not do this.

<img src="./img/threefold__zdb_arch.jpg" alt="threefold_zdb_arch" width="800"/>

### NC3: Encrypted secure networking: the Planetary Network

The planetary network is an overlay network which lives on top of the existing internet (or any other network created). In this network, everyone can direct connect to everyone and routing does not rely on ISP and Tier 1 providers routing tables. The technology uses a Distributed Hash Table that allows all participating nodes to find the best network path to where it needs to send data. End-to-end encryption between application on the zero-OS's.

Each user and network point is strongly authenticated and uniquely identified, independent of the network carrier used. There is no need for a centralized firewall or VPN solutions, as there is a circle based networking security in place.

Benefits :
- shortest possible paths between peers, independent of the network providers routing decisions
- end-to-end encrypted data transport create full security
- peer2peer links like meshed wireless
- broken internet links do not affect the operating of traffic by re-routing traffic when needed

<img src="./img/threefold__planet_net_.jpg" alt="planetary_network" width="800"/>


### NC4: Filesystem that presents remote storage to blockchain node

Quantum Safe Storage System uses a dispersed storage algorithm to distribute the data in a smart way and store data in different locations. The original object is fragmented, compressed and encrypted, and than a "description" is created of that compressed and encrypted fragment which is stored. The original compressed and encrypted data is deleted.  Only that description of that data part  of the information is stored, making it impossible to understand what data(part) is stored on a single device as you need all the descriptions together to be able to "un-describe" the compressed and encrypted original data

The data is described in a way such that a person aiming to hack into the low-level data (which is almost impossible in itself), will only find non-relevant information on this storage infrastructure and the other data shards can’t be re-created, making it quantum-proof.

Quantum Safe Storage System offers the following storage benefits:

- Store Petabytes of data at hyper-competitive pricing.
- Quantum-safe security (not even a quantum computer can hack).
- A filesystem interface see Quantum Safe Filesystem
- Unlimited scalability provided by the ThreeFold P2P infrastructure.
- Self-healing capability of the storage layer ensures your data remains available at all times.

<img src="./img/threefold__zos_zstor.jpg" alt="zos_zero_store" width="800"/>

### NC5: Secure access to de-duplicated data

...

ThreeFold Tech has developed the technology to store immutable records in a more space efficient way, relying on a fully decentralized grid of storage capacity. No participant has the full storage volume on his hard drive, however the combination of all participants allows recomposing of the full ledger with all records. This method brings many benefits: 
- The storage happens in a very, quantum-resilient way, as attacking one chunk gives insufficient information to recreate the authentic data;
- Storage grows slower over time compared to a classic blockchain setup, as storage overhead can be limited to about 20% instead of the ‘traditional’ 10000% (in the case of 100 participants running a blockchain node) overhead;
- It allows for an easy way to implement pruning: only the current state is really required to be stored locally, and when transactions come in, a recalculation is made, and the storing of the historical transactions is directly done using QSFS

### NC6: Proof of Retrievability (POR)

We need to have a way for archived chain to have proof of retrievability (POR). A POR is a protocol in which a server/archive proves to a client that a target file F is intact, in the sense that the client can retrieve all of F from the server with high probability.

For a good working pruning solution POR is a necessary conditions

## Proposed solution methods to architect a pruning solution

### Introduction

For many blockchain nodes every (full / validator) node that partakes in the blockchain operation run the layer-1 blockchain software which is part of the blockchain operations.  At this point in time we leave the complexities out that come with the the blockchain being permissionless or permissioned.  This has major impact on how nodes build trust between themselves and the resulting consensus mechanism that operates the blockchain protocol.  For this part of the research we are going to focus on how these blockchain nodes store that data after consensus and trust has been build between all participating nodes.

### Method 1: Use traditional full and incremental backup principles to backup a database offchain

#### Description

Any blockchain node uses local available disk drives to write its full chain data and chain state to.  For some (layer-1) protocols a database is used (like [Monero](https://github.com/LMDB/bitmonero)) and for others other data formats have been chosen. These formats might be databases, key values stores or other means of putting data in a structured format before committing it to disk.

Popular cryptocurrencies use a mix of LevelDB and BerkeleyDB. High-performance blockchain databases such as BigchainDB and ProvenDB are using MongoDB.  So each blockchain node runs a local database of sort to store its local chain data and indexes it in a certain way to make it searchable and fast responding to queries.

<img src="../img/blockchain_local_operation.svg" alt="blockchain_pruning_option_1" width="800"/>

In such a setup one can look at database specific export or backup features to partial exports and backups to store a part af the chain data off-node.

<img src="../img/blockchain_local_operation_pruning.svg" alt="blockchain_pruning_option_1" width="800"/>

In this method the blockchain node database is used to create a periodic export of the database and all of it's new stored blocks and it is store on a local fuse based file system than has a local storage devices for physical storage.  The fuse filesystem has hooks built in to engage an erasure coding engine that takes the new data, create data fragments from it, compresses and encrypts tha fragments and then creates a mathematical description of these fragments (plus creates mode mathematical descriptions based on the same compressed and encrypted fragments to create redundancy).  For a more detailed description how this works please see [here](https://library.threefold.me/info/threefold#/qss/threefold__qss_algorithm).


**Requirements**

| Requirement | Achieved? |Remarks|
|:---- |:----:|:----:|
| pruning solution should be able to run *on* node as well as *off* node by using largely the same method and software | yes | 1. |
| the pruning solution should be able to work using the blockchain nodes local storage capacity only and store de-duplicated chain data on these nodes resulting in an over all lower amount of total disk space usage used for all `N` nodes. | yes |  No |
|the pruning solution uses a trusted storage facility that uses external storage capacity to store de-duplicated chain data and is (possibly) governed by a DAO | No | 2. |
| the pruning solution should store the chain data such that it provides a proof of recovery method | TBD | 3. |
| the pruning solution should transport data (by network) *off* node in such a way that it cannot be stopped by entities (read ISP's, governments and other legal entities) | Yes | No |
| the pruning solution should allow node operators to *opt in* and *opt out* of using it. | Yes | No |

*Remarks*
1. this methods uses all of the participating node to run software and store data. The fragment dispatcher and dedupe process creates consensus on which fragment is stored on what node and creates meta data to be able to retrieve the de-duplicated DB export container chain data.
2. the external storage facility to the node are all the other blockchain nodes `N-1`.  Since the blockchain protocol builds trust and consensus the trust is implicit here.
3. the proof of recovery method is working for a file based storage system build with this technology where there is a single data injection point.  In this use case there are `N` data injection points which is theoretically inject the same data. The proof algorithm needs to be build but research shows that this can be done.


**Necessary conditions** 

| Nr. | Necessary condition | Achieved? | Remarks |
| ---- | ----|:----:|:----:| 
| 1 | Secure, autonomous, decentralized and distributed data processing and storage utility | Yes | 1. |
| 2 | Immutable and always-append storage device |  Yes | 2.|
| 3 | Encrypted secure networking | Yes | 3.  |
| 4| A filesystem that presents remote storage to blockchain node | Yes | 4. |
| 5 | Secure access to remote stored and de-duplicated data | Yes | No |
| 6 | Proof of recoverability | Yes | 5. |

*Remarks*
1. The ThreeFold stack is version 3 and has a proven track record of providing decentralised and distributed data processing and storage utility.
2. This is what zero-DB has been designed to do. Please find more information [here](https://github.com/threefoldtech/0-db)
3. The ThreeFold planetary network does exactly this. PLease find more information [here](https://github.com/threefoldtech/TF-NetworkConnector_)
4. Please find mode information [here](https://github.com/threefoldtech/quantum-storage)
5. the proof of recovery method is working for a file based storage system build with this technology where there is a single data injection point.  In this use case there are `N` data injection points which is theoretically inject the same data. The proof algorithm needs to be build but research shows that this can be done.


### Method 2: Install and use additional software on the node to prune chain data

Method 2 is about integrating the backup tooling into the node software. Fuse file system will be created on a node, and data will be sent to ZSTOR. Then, a proof process is executed to build consensus on the same data that is archived in zstor as the one that was used in the block validation consensus. A block is split up in fragments, parity blocks are added for both the data and for the proofs. Once fragments are created, they are distributed over different nodes: each of p+q nodes stores one of the created fragments, into the zdb present in the node. 

<img src="../img/pruning_block_write_option_1.svg" alt="blockchain pruning option 1" width="800"/>

<<Scott to complete>>

**Necessary conditions** 

**Requirements**

| Requirement | Achieved? | Remarks |
| ---- | ---- | ----- |
| pruning solution should be able to run *on* node as well as *off* node by using largely the same method and software | yes | No |
| the pruning solution should be able to work using the blockchain nodes local storage capacity only and store de-duplicated chain data on these nodes resulting in an over all lower amount of total disk space usage used for all `N` nodes. | yes |  No |
|the pruning solution uses a trusted storage facility that uses external storage capacity to store de-duplicated chain data and is (possibly) governed by a DAO | No | No |
| the pruning solution should store the chain data such that it provides a proof of recovery method | TBD | No |
| the pruning solution should transport data (by network) *off* node in such a way that it cannot be stopped by entities (read ISP's, governments and other legal entities) | Yes | No |
| the pruning solution should allow node operators to *opt in* and *opt out* of using it. | Yes | No |

**Necessary conditions** 

| Nr. | Necessary condition | Achieved? | Remarks |
| ---- | ----| ---- | ---- | 
| 1 | Secure, autonomous, decentralized and distributed data processing and storage utility | Yes | No |
| 2 | Immutable and always-append storage device |  Yes | No |
| 3 | Encrypted secure networking | Yes | No |
| 4| A filesystem that presents remote storage to blockchain node | Yes | No |
| 5 | Secure access to remote stored and de-duplicated data | Yes | No |
| 6 | Proof of recoverability | Yes | No |


### Method 3: Integrate pruning software module into permissionless blockchain

Method 2 could work well in a permissioned setup. 
Method 3 is an add-on to method 2 to make it also work in a permissionless consensus model. 

The problem with permissionless setups is the fact that there is no hard commitment from the validators that they will continue operating, and that a validator expects some incentive in return for the validator services provided. Especially when dealing with historic information, current consensus models only provide in rewards for closing the current blocks, with the 'obligation' to also keep history up. This leads to the high redundancy in storage. Pruning in these setups is only solved creating a hierarchies in the node structure, which is contradictory to the decentralized nature of permissionless blockchains. 

We propose a four-step approach for a non-hierarchical pruning protocol that works in a permissionless setup. It involves elections for the storage of historic batches, each time a new batch of blocks is being built. 

#### Step 1 : Consensus

The first step in the consensus protocol does not change: n nodes agree on validity of blocks. Once consensus is achieved (using whatever consensus protocol like PoS, PoW, ...) records are stored and de-duplicated over all n nodes. 
With one difference, however, which is that the transactions are stored in a Z-Stor dedupe format, over p storage nodes + q redundant ones (typically 20% of overhead) in a Zero-DB format. 

#### Step 2 : Fill block batch

We propose to group a number of blocks, either for an agreed number of blocks. Idea is to come to a sufficient volume to put aside (ex. 30 MB), and keep the transactional history on-chain as long as the agreed block number hasn't been reached. During this period, history is collected in n*(p+q) equal chunks of data.  

#### Step 3 : Batch closing 

Once the agreed block number has been fully completed (= consensus achieved), the chunks are closed and are ready to be put off-chain. The zstor format ensures that data is immutable, a fingerprint is created and linking information to where the chunks can be found. This information is registered on-chain. 


#### Step 4 : Off-chain storage follow-up

A few challenges arise with this setup :
- Data rot can happen, a node can disconnect or other events can happen making that a node starts behaving as a bad actor. 
- Every time a batch is closed, the metadata describing the location of the historic batches also go off-chain. 

Both elements require an active follow-up of where historic batches of transactions are to be found is needed. 
This is why the following is proposed:
- Within each new storage batch process, a process is launched to register the location of historic batches on the new active part of the chain. 
- Over time, a number of batches are created. Let's call the number of completed batches `y`. 
- An election needs to happen of `y * (p + q)` chunks. During this election, nodes propose the storing of a chunk, with a number of rules: 
  - The number of eligible chunks per batch per node is less than q (and preferably 1), in order to guarantee that the information is decentralized enough to ensure continuity of service in case a node gets disconnected. 
  - A batch can't be closed as long as the election process for each of the `y * (p + q)` hasn't been completed. 
  - An election process is triggered by 'candidates', launching a 'proof of storage' transaction, indicating the location of the chunk and a fingerprint of the data including recent info (nonce, timestamp, ... ) and proof of authenticity. The election process for a history batch is completed once `p + q` transactions are selected. 
- For older chunks, re-election in every new active batch is possible. However, a chunk storage holder should present his 'proof of storage' in every new batch. 
- In a permissioned model, the election of new chunk holders is part of the authority rights, and no incentive is to be foreseen. For permissionless models, an incentivization mechanism needs to be worked out for every new election. 

#### How to split up the data chunks when a batch has just been completed ? 

At batch completion, there are logically n*(p+q) chunks available. However, this completed batch can't be pruned until the completion of the next batch, during which election happens of p+q 'historic chunk batch holders'. 
Number of chunks for every election needed is p+q, with p and q natural numbers and p>1, q>0. q=0 is not viable, as data rot might occur, so the idea is that there is always an objective to keep p+q chunks available, and when a chunks gets unreachable, a new chunk is being created.

The intention is to have (p+q) chunks available at any moment in time, for each batch, hence the re-election of every chunk for every new batch. The keeping of 1 or more of these chunks can be incorporated into the validator node code, but will require way less storage volume than the current full nodes. Moreover the storage can be kept off-chain, as an 'active' transaction archive. 

#### How to recollect the pieces if a historical transaction is to be recovered ? 

- In every of the y completed storage batches, all info is available as a transaction to recover y * (p + q) chunks, and with this info the full transaction history can be recovered, using y * p chunks and y * q spare ones. 

**Requirements**

| Requirement | Achieved? | Remarks |
| ---- | ---- | ----- |
| pruning solution should be able to run *on* node as well as *off* node by using largely the same method and software | yes | No |
| the pruning solution should be able to work using the blockchain nodes local storage capacity only and store de-duplicated chain data on these nodes resulting in an over all lower amount of total disk space usage used for all `N` nodes. | yes |  No |
|the pruning solution uses a trusted storage facility that uses external storage capacity to store de-duplicated chain data and is (possibly) governed by a DAO | No | No |
| the pruning solution should store the chain data such that it provides a proof of recovery method | TBD | No |
| the pruning solution should transport data (by network) *off* node in such a way that it cannot be stopped by entities (read ISP's, governments and other legal entities) | Yes | No |
| the pruning solution should allow node operators to *opt in* and *opt out* of using it. | Yes | No |

**Necessary conditions** 

| Nr. | Necessary condition | Achieved? | Remarks |
| ---- | ----| ---- | ---- | 
| 1 | Secure, autonomous, decentralized and distributed data processing and storage utility | Yes | No |
| 2 | Immutable and always-append storage device |  Yes | No |
| 3 | Encrypted secure networking | Yes | No |
| 4| A filesystem that presents remote storage to blockchain node | Yes | No |
| 5 | Secure access to remote stored and de-duplicated data | Yes | No |
| 6 | Proof of recoverability | Yes | No |


### Method 4: Use an external (decentralized storage facility and uses chain consensus)

The most elegant solution would be to have the blockchain node
<img src="../img/pruning_block_write_option_2.svg" alt="blockchain pruning option 2" width="800"/>

**Requirements**

| Requirement | Achieved? | Remarks |
| ---- | ---- | ----- |
| pruning solution should be able to run *on* node as well as *off* node by using largely the same method and software | yes | No |
| the pruning solution should be able to work using the blockchain nodes local storage capacity only and store de-duplicated chain data on these nodes resulting in an over all lower amount of total disk space usage used for all `N` nodes. | yes |  No |
|the pruning solution uses a trusted storage facility that uses external storage capacity to store de-duplicated chain data and is (possibly) governed by a DAO | No | No |
| the pruning solution should store the chain data such that it provides a proof of recovery method | TBD | No |
| the pruning solution should transport data (by network) *off* node in such a way that it cannot be stopped by entities (read ISP's, governments and other legal entities) | Yes | No |
| the pruning solution should allow node operators to *opt in* and *opt out* of using it. | Yes | No |

**Necessary conditions** 

| Nr. | Necessary condition | Achieved? | Remarks |
| ---- | ----| ---- | ---- | 
| 1 | Secure, autonomous, decentralized and distributed data processing and storage utility | Yes | No |
| 2 | Immutable and always-append storage device |  Yes | No |
| 3 | Encrypted secure networking | Yes | No |
| 4| A filesystem that presents remote storage to blockchain node | Yes | No |
| 5 | Secure access to remote stored and de-duplicated data | Yes | No |
| 6 | Proof of recoverability | Yes | No |