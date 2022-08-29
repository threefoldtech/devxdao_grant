# RESEARCH DOCUMENT
## DEVxDAO GRANT Proposal #37

### Challenge
The current technology reality is that (level-1) blockchains by design carry historical data forever.  The nature of a blockchain is that it stores data immutable and in an always append manner.  So from the moment of inception of the blockchain (the "genesis" block) to the current point in time all data (blocks) ever created need to be stored _and_ available on all participating (full) nodes.

This has profound implications for successfull (layer-1) blockchains, regardless of their purpose. Whether the blockchain is a pure value transaction blockchain and stores value transations betweem wallets or it is a full blown smart contract system storing a lot more data per contract, and contract execution results, it is all compounding to a forever growing storage requirement.

One important aspect of a blockchain is that is has to have an element of free participation.  In order to achieve decentralisation there can be no central control or ownership of the majority 

<!-- have to insert a parapgraph that it is n integral part of being a blockchain that participation is permissionless.  Anyone can choose to participate and run a (anytype) of node.  This brings the challenge that a forever increasin amount of data to be stored is going to lower the number of independent people to make the effort to participate since the costs for doing so are increasing.  Blockchain projects can create incentives to overcome this but it does increase the cost for operating a blockchain by doing that - regardless of the costs is for the node operator or the incenptive provided by the project to the operator -->


### Solutions implemented to date

#### Compress data
This is probably the most used solution path solving the issue.  All participating (full) nodes compress the blocks created to have a minumum data storage footprint.  There are many compression and encryption algorithms available and depending on the specific environment of the blockchain nodes certain algorithms present better options than others.

##### SWOT analysis
**Strengths**
- simple to implement, compression and encryption algorithms available

**Weaknesses**
- it does not solve the issue, it postpones the issue becoming a problem

**Opportunities**
- quick to implement, quick to deploy.

**Threats**
- long term the problem will hit.  Choosing this path will allow you to go to market quickly but then you have to hope that a solution will present itself before the issue will become a problem.

#### Lower the number of full nodes in a layer-1 blockchain
Full nodes refer to blockchain nodes that contain and have 100% of the chain history available online with a proven history of an intact, true and secure chain.  This is often referred to as a "permissioned" chain.  A few permissioned organisations or people are tasked to provide full nodes and deal with all the operational, security, scaling and realibility tasks.  This can be with and without a rewards for doing this.

Non-permissioned nodes can be allowed to alleviate some of the operational workload, but these nodes are not considered to be authorative fir the true chain history. The true chain history is only provided by the (few) permissioned (full) chain nodes.

This path is also chosen by many blockchain protocol implementations to circumvent the problem of having every expanding and increasing storage costs for the node operators.  However much some organisation or individual is willing to suport to support a project if the rewards are not higher than the cost base of operating full nodes the risk is there that node operators cease to supoprt the nodes which challenges the ingrety and security of the total chain.


##### SWOT analysis
**Strengths**
- Efficient, affordable way of guaranteeing correct, secure and scalable chain operations

**Weaknesses**
- It steps away from the decentralisation a blockchain is presenting over traditional database solution. The strength of a blockchain solution is that anyone can opt in to contribute and helps to achieve security and safety.  By making blockchains permissionless the security and safety is lowered because the full nodes ware operated by persmission organisations and people.
- One node still has the full volume required, which makes running it and managing the issues around very big volumes still relevant. 

**Opportunities**
Create a governance structure around blockchain technology that is in line with the traditional IT industry and paradigms while still bringing in the innovation achieved by blockchain technology.

**Threats**
Secure operations is threated by having a limited, known number of permissioned operators.  The form a set of single points of failure for the whole chains operations and security.

#### Create a hierarchy of nodes in the layer-1 blockchain
Another way to overcome to have a blockchain being choked by a forever growing storage need for all nodes and loosing support from node operators is to split the full chain process (workload) into subprocesses.  Each subprocess can now be worked on by specific type of nodes that are tailored to operate that one part of the process.  Examples are:
    - transaction nodes: a node that only provide transaction capabilties and possible store the results
    - validaton nodes: nodes that look at the transaction nodes and validate through some sort of consensus mechanism the transactions
    - core/full nodes: nodes that store the full chain history and are authorative for chain content 
    - edge nodes: remote nodes that perform edge transaction in a fast and efficient way.  There has to be some form of synchronisation between edge nodes and core/full nodes.

##### SWOT analysis 

**Strenghts**
- provides indepedent scalability between differnet functions / processes off the full chain.
**Weaknesses**
- overhead is created by relying on the network to communicate between the different functions/subprocesses.  Network speed might effect overall performance on the chain 
**Opportunities**
- when required subprocesses can easily be broken up into smaller pieces when needed or vice versa integrated into large components.
**Threats**
- many different components have network interfaces and there are is a realistic chance that hackers might attack the network interfaces from the different nodes.

<!-- 
put an increasing demand on storage requirements for all participating nodes. This is not very sustainable and efficient.
The number of implementations of DAO's is going to be exponentially growing and there is a need for level-1 blockchain protocols to be able to deal with the increased volume of transactions and history where pruning is going to be needed. 
A blockchain is in essence a ledger of immutable records, which need to be combined to form an end ‘world state’. In order to obtain this world state, history needs to be kept as from genesys of the blockchain. 
Increase in volume and transactions creates issues at some point in time, with a ledger that becomes too big for a decent synchronisation. 
-->


**insert some example cases where that is already becoming a problem and what is being done to solve it**
  
### Solution
  
ThreeFold Tech has developed the technology to store immutable records in more space efficient way, relying on a fully decentralised grid of storage capacity. 
No participant has the full storage volume on his hard drive, however the combination of all participants allows recomposing of the full ledger with all records. This method brings many benefits: 
- The storage happens in a very, quantum-resilient way, as attacking one chunk gives insufficient information to recreate the authentic data
- Storage grows slower over time compared to a classic blockchain setup, as storage overhead can be limited to about 20% instead of the ‘traditional’ 10000% (in the case of 100 participants running a blockchain node) overhead
- It allows for an easy way to implement pruning: only the current state is really required to be stored locally, and when transactions come in, a recalculation is made, and the storing of the historical transactions is directly done using QSFS

### What is QSFS ?

QSFS stands for Quantum-Safe File System. 
It is a redundant filesystem, which can store petabytes of information.

Unique features are : 
- Unlimited scalable (many petabytes) filesystem
- Data is spread over many devices owned by different, independent hardware owners called farmers. Together, these farmers provide the capacity to a hardware grid, call the ThreeFold Grid. 
- Dispersion over multiple sites ensures 100% privacy of the data, as no farmer knows what the data is about. Even a quantum computer cannot decrypt the data when attacking a node, as one node contains insufficient information to unambiguously recreate the authentic data.
- Data can’t be lost: there is a protection for datarot, data will auto-repair
- Data is append-only and immutable by design of the protocol, so it’s fit for storing ledger history. Even with sites going down, data is not lost with ‘operational’ backup nodes in place
- Up to 10x more efficient than storing on classic storage cloud systems. Overhead of about 20% is sufficient to have a secure archive.
- Can be mounted as filesystem on any OS or any deployment system (OSX, Linux, Windows, Docker, Kubernetes, TFGrid, ...)
- It is compatible with +/- all data workloads (exception: high performance data driven workloads like a database)
- Self-healing: when node or disk lost, storage system can get back to original redundancy level
Helps with compliance to regulations like GDPR (as the hosting facility has no view on what is stored, information is encrypted and incomplete)
- Hybrid : can be installed onsite, public, private, …
- Read-write caching on encoding node (the front end)

### Components

#### 0-db storage engine

This is an always-append database, which stores objects in an immutable format, which allows to have history out-of-the-box, good performance on disk, low overhead, easy data structure, easy backup (linear copy and immuable files).
We use two types of 0-db: 
- One for the storage backend 
- One for 0-db-fs, which is where data needs to be, to be available via the fuse filesystem. This 0-db can offload its data to an external process (user-defined) and can also request missing data to be retrieved, if some data are missing.

This enables the database to spread and not always use local storage space if data is not read.
One external process to handle these cases is 0-stor-v2.

#### 0-db-fs FUSE layer which use the storage engine in an optimized way

This is a simple filesystem driver which uses 0-db as the primary storage engine.
Directories and metadata are stored in a dedicated namespace, file payloads are saved in another dedicated namespace.
The filesystem uses an internal cache system made, not for performance, but to optimize how data is stored in the 0-db to avoid overhead as much as possible.

#### 0-stor-v2 engine to save/backup data to safe location

This tool can be used as external process for 0-db, or can be used for any purpose. It just takes one file as input, it encrypts this file in AES based on a key user-defined, encodes the file and spreads the data to multiple 0-db’s. Based on the policy (configurable), some amount of 0-db’s can be unreachable, data can still retrieved and missing database can even be rebuilt to keep full consistency available.
Metadata needed to get data back from 0-db in the right order, are stored in others 0-db.

### Protocol

With the protocol we intend to build a mechanism where : 
- The current state can be kept locally and recalculated when new transactions come in, before spreading it out 
- Historical transactions are directly stored in QSFS, available for consultation and synchronisation purposes (in case new validators join). 
