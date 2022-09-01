# Casperlabs Storage Integration QSFS

Casper uses [lmdb] for the persistent storage in their blockchain. Lmdb,
an in process key-value store, saves its data in __a single file__ on
disk. Since there is ever only 1 data file, and this data file is not
changed (i.e. it is always modified), this rules out the usage of
0-db-fs / 0-stor to run (part of) the database.

The next best option is to analyze what data is stored in the DB.
Mostly, we are interested in block information, as this is the main
source of historic data. The idea would be to periodically remove "old"
blocks from the DB, and move it to a secondary DB. If the amount of
blocks stored in such a secondary instance is limited, this effectively
creates a list of read-only (as blocks, once accepted and written, will
never change) secondary instance data files. These files can then be
written to 0-db-fs / 0-stor once they are finished, and removed locally.
If historical data is needed from these blocks, the files can be
recovered and read.

It should be noted the lmdb storage format is architecture dependant
(x86 vs x86_64, little endian vs big endian). Furthermore, there are no
guarantees about the internal layout of the data file in lmdb. As such,
we can't really use lmdb for this, convenient as that would be. This can
be solved however by creating a deterministic storage format for the
data, and then writing this to a file. For example, we can simply use
[bincode], a rust binary encoder, to encode blocks, and write the
results to the file. Given the same settings, which we can set
statically in the software, the same result will be produced.
Furthermore, we can statically agree to create such a file every e.g.
10K blocks (amount needs some research regarding block size). This will
cause the same file to be generated on every node. This file can then be
encoded and uploaded.

All of the above does require serious protocol support. Most notably,
there needs to be consensus over which blocks to write to secondary
storage and when. For the main chain, this is not a problem, as every
node is expected to have these blocks (the exception would be temporary
small forks, if this would be possible. For this reason blocks to be
saved need to be far enough in the past). It is harder to also agree on
orphaned blocks, without having some kind of active consensus mechanism.
Since orphaned blocks are persisted in storage, they should eventually
be moved to this secondary storage, however not all nodes will have this
orphaned block, as some nodes might, e.g. have joined the network after
this block was broadcast. This requires more investigation in the casper
consensus protocol.

In this scenario, it seems best to run directly against 0-stor, as we
would upload single files. Furthermore, 0-stor can be modified to return
the metadata, and this metadata could then be broadcast on chain (through
means of a transaction?). This makes sure every node has the metadata
available to recover the uploaded file locally. (TODO: how to reach
consensus over which blocks to store and what 0-dbs to use, who does
upload, ...). Since both 0-stor and the casper blockchain are in rust,
we can also opt to embed 0-stor (as we only need the core
functionality).

> todo: research storage layer of casper, put all findings here


## Aim 


The aim is to provide a storage solution, which manages to 
- efficiently store historical data (with regards to used space)
- allows the data to be retrieved even when nodes are no longer reachable, or loose access to the data (intentional or accidental).

## Solution : LMDB integrated with 0-stor

At Threefold, we already developed a solution which achieves most of this in [0-stor]. This allows storing files in a distributed, redundant fashion, using `forward-looking error correcting` codes. Considering the existing storage layer in the [casper node], we feel that integration and interoperation between 0-stor and Casper storage is a viable solution to the given problem.
[0-stor] is built to reliably store files with minimal overhead. Even though it can be run as a daemon in stand-alone mode, Threefold has developed a filesystem on top of it. An actual integration seems to be the best way forward: this allows the chain itself to drive the actual storage process. Considering that the existing storage layer uses [lmdb], which is a single file embedded datastore, we will propose some modifications to this storage layer, to allow the usage of [0-stor].

- [x] what is size of files -> lmdb uses sparse files, on my desktop at
	home the database file has a registered size of 750GB at startup
- [x] what is min file, max -> Not relevant
- [ ] performance requirements 
- [x] what is data structure -> Single file
- [x] how to manipulate positioning of the bigger files -> Not relevant
- [x] are the large blocks the same ? -> Not relevant
- [ ] need to know how consensus has been achieved


### Limit to historic state 


First, it should be noted that [0-stor] is _not_ intended to be a high speed storage solution, but rather, reliable and space efficient. As such, we can't store everything.
If we identify the storage at some block, then we can split this into an active and a historic storage part. We consider the active state to be the state which was either recently created, or can be accessed as a result of normal operation of the network. This includes recent blocks, recently deployed contracts, ...
Historic data is composed of data which is no longer accessed by the network itself, such as blocks which were created some time ago. Considering the speed restriction, we will only consider historic state for processing.


[lmdb]: http://www.lmdb.tech/doc/index.html
[bincode]: https://github.com/bincode-org/bincode


### File encoding 

Since Casper's current blockchain storage implementation is based on [lmdb], which operates on a
single data file, the option of encoding database files directly (should that be possible given the previously stated constraint) is ruled out. 

To allow [0-stor] operation, the following addition can be made. After every new block is stored,
an older block (in practice, a block which is a fixed height behind the new block) is read from storage, written to a file, and deleted from storage. Every x amount of blocks, the storage file is encoded and uploaded, and a new storage file is started. This also means that a storage file has a fixed amount of blocks. The encoding of the data needs to be deterministic, so that all the nodes in the chain participating in the storage protocol have the exact same data. The above is specific for blocks, but can be used for other data as well. 
It should be pointed out that a node can't actually delete the data, as it needs to retain some way of knowing where it is. Multiple mechanisms can be used for this. For good operation with [0-stor] however the file name needs to be deterministic. 
Besides this, the value in the database can be converted to point to this file name, which allows
the storage layer to know that it needs to fetch the actual value from an encoded blob. Depending on the data and structuring, more efficient methods are also possible, which simply indicate that some data is in a blob. For instance, if a fixed amount of blocks is encoded per file, the file name can be used to indicate which blocks are in it based on their respective heights in the chain. It is then sufficient to merely indicate in the database that a block is off-chain.

### Optional encryption 

[0-stor] is build to support encryption of data before encoding it and uploading the chunks. Since this will generally be used for publicly known data, a small modification can be made which does not force this behavior. That removes overhead from the encryption step, which is not needed, but still allows it in case someone is running a private chain.

### Requirements for Node implementation

We consider the following requirements for any node to store a chunk of data. 

#### Incentive 

For permissionless blockchains, the node needs to have incentive to do so, as storage uses disk space, which has a real world cost. A simple way to achieve this is to have a periodic payout for nodes which store data 
- through creating of new tokens
- by distributing (part of) transaction fees. 

#### Treatment of nodes behaving badly

Secondly, a node which has some data stored needs to make sure this is accessible for everyone, and that the data is not lost or otherwise corrupted. For a node to enforce this, the chain needs some way to punish the node if the condition is failed. One approach is to only allow nodes which have some amount of tokens staked participate in data archival, where the stake can be slashed in case a violation is detected. In this scheme, a node should only be able to unstake if it has no data stored. To accomplish this, a node needs the ability to step down as an archiver, which then causes the chain to elect a new node to store the data on. Once the new archiver indicates that the data is stored, the old node's unstaking completes. At this time, we believe that this consensus scheme can be tied into the existing consensus scheme for block validation. When a node stakes, it can indicate whether it wants to archive or not.

#### Election 

After every x amount of blocks, when the storage file is rotated, the chain elects an ordered set of nodes out of all potential archivers. The election mechanism itself does not matter much. An option could be a [modified Phragmén election]. Note that it is possible to run the election offline, and only commit the results on chain.
This might be needed, as the algorithm takes a noticeable amount of time to finish, which is impractical in the time constraint context of block creating. 
Once the election has ended, every elected node can use [0-stor] to compute the storage chunks. They then archive the chunk corresponding to their ranking in the election, and publish the metadata of the storage on chain. This metadata includes the hash of the chunk.
Since every archiver needs to compute every chunk, they can all verify each other's hashes and make sure the data is saved correctly.

#### 0-db append-only key-value store

[0-stor] saves data to [0-db], an append-only key-value store. This is ideal, as data written is permanent and will never change. The info needed to connect to the right namespace is included in the metadata (IP:port and namespace name). This allows anyone to fetch the chunks for a particular data blob and reconstruct it locally.
In case a [0-db] needs to have scheduled downtime, or otherwise needs to be replaced, a node can spin up a new one, copy the data from the original one, and finally update the metadata on-chain. They can then safely remove the old db, without getting their funds slashed. Similarly, if another node takes ownership of a data shard because the original archiver wants to unstake, they can simply read the data from storage, verify the checksum, and write it to their own [0-db]. The transfer is finished
by uploading the new metadata to the chain.

#### Metadata 

It is worth noting that this approach can be used to offload metadata storage itself, should this ever be required. In that case, metadata pieces can also be stored in a file, which is then encoded and uploaded. If a node wants to fetch a particular piece of information, it first fetches the metadata blob, reconstructs it, and then uses the contained data to fetch and decode the blob with the actually needed info.

[lmdb]: http://www.lmdb.tech/doc/index.html
[0-stor]: https://github.com/threefoldtech/0-stor_v2
[casper node]: https://github.com/casper-network/casper-node
[modified Phragmén election]: https://aaai.org/ocs/index.php/AAAI/AAAI17/paper/download/14757/13791
[0-db]: https://github.com/threefoldtech/0-db

