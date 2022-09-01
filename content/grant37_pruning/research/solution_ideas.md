
## Proposed solution methods to architect a pruning solution

> TODO: something went wrong in porting the data, we need to go back to engineers and find the images + update the document

### Introduction

For many blockchain nodes every (full / validator) node that partakes in the blockchain operation run the layer-1 blockchain software which is part of the blockchain operations.  

At this point in time we leave the complexities out that come with the the blockchain being permissionless or permissioned.  This has major impact on how nodes build trust between themselves and the resulting consensus mechanism that operates the blockchain protocol.  

For this part of the research we are going to focus on how these blockchain nodes store that data after consensus and trust has been build between all participating nodes.

### Method 1: Use traditional full and incremental backup/archive principles to backup a database offchain

#### Description

Any blockchain node uses local available disk drives to write its full chain data and chain state to.  For some (layer-1) protocols a database is used (like [Monero](https://github.com/LMDB/bitmonero)) and for others other data formats have been chosen. These formats might be databases, key values stores or other means of putting data in a structured format before committing it to disk.

Popular cryptocurrencies use a mix of LevelDB and BerkeleyDB. High-performance blockchain databases such as BigchainDB and ProvenDB are using MongoDB.  So each blockchain node runs a local database of sort to store its local chain data and indexes it in a certain way to make it searchable and fast responding to queries.

<img src="img/blockchain_local_operation.svg" alt="blockchain_pruning_option_1" width="800"/>

In such a setup one can look at database specific export or backup features to partial exports and backups to store a part af the chain data off-node.

<img src="img/blockchain_local_operation_pruning.svg" alt="blockchain_pruning_option_1" width="800"/>

In this method the blockchain node database is used to create a periodic export of the database and all of it's new stored blocks and it is store on a local fuse based file system than has a local storage devices for physical storage.  

The quantum safe filesystem has hooks built in to engage a forward looking error correcting coding engine that takes the new data, create data fragments from it, compresses and encrypts tha fragments and then creates a mathematical description of these fragments (plus creates mode mathematical descriptions based on the same compressed and encrypted fragments to create redundancy).  For a more detailed description how this works please see [here](../technology/qsss/qss_algorithm.md).


**Link To Requirements**

| Requirement | Achieved? |Remarks|
|:---- |:----:|:----:|
| pruning solution should be able to run *on* node as well as *off* node by using largely the same method and software | yes | 1. |
| the pruning solution should be able to work using the blockchain nodes local storage capacity only and store de-duplicated chain data on these nodes resulting in an over all lower amount of total disk space usage used for all `N` nodes. | yes |  . |
|the pruning solution uses a trusted storage facility that uses external storage capacity to store de-duplicated chain data and is (possibly) governed by a DAO | No | 2. |
| the pruning solution should store the chain data such that it provides a proof of recovery method | TBD | 3. |
| the pruning solution should transport data (by network) *off* node in such a way that it cannot be stopped by entities (read ISP's, governments and other legal entities) | Yes | . |
| the pruning solution should allow node operators to *opt in* and *opt out* of using it. | Yes | . |

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

<img src="img/pruning_block_write_option_1.svg" alt="blockchain pruning option 1" width="800"/>

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