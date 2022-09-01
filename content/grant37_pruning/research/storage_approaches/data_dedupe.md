
## Data Deduplication

Data deduplicatio technology has been around for the length of the digital age. We should take a look at what the findings and results are to do reliable, trustworthy and secure backups.

Backup de-duplication was invented in the early 2000's. Up to that point in time datacenters with thousands of servers with the same OS would backup the same systems files a thousand times over. With the rise of the digital age this became very expensive quickly efficiency and competitive drivers forced innovators to start looking at data de-duplication. Once of the earliest implementations are described in this [patent](https://patents.justia.com/patent/7254596) which is by the way a patent as done by one of our first companies from our Incubator, please do not we don't believe in patents any more and we don't execute on any of them, we believe the only way forward is opensource. 

The use of hashes to comparing local files and backed up files in a central storage facility is a very elegant manner to know if a file (read data) is already backed up. This works not just for one server with files installed but also allows to reach large efficiency gains over a large number of servers. 

Excerpt from the patent file:

*The invention relates to an improvement in backup technology, and more particularly, creates a solution for massive server backup in Internet data center and enterprise data center environments, resulting into a solution for disaster recovery and data protection. The invention is an improved System and a Method of using a hashing key of file content for more efficient and more effective computer file and computer program backups.*

*The first step in the process is to scan the file system on the target machine (computer system to be backed up) and creating a hashing key, creating a unique digital code for each of the files to be backed up. In a preferred embodiment, in order to reduce the processing time, a hashing key is only created for the files having a modification date attributed that is more recent than the last backup.*

*The resulting hashing keys are stored in a local database—a database on the target computer, for example—for further comparison during the current, and future, backup sessions. The local database also includes the complete path of each backed up file.*

*The stored hashing keys are checked against previous hashing key entries in the local database. In this way, the hashing keys are used to check each local file to determine if it was previously backed up on the target system. The hashing keys not found in the local database key list are used in the next step of the process.*

*The hashing keys that were not found in the local hashing key database are checked against the hashing keys of the files stored on a central storage server. This check is used to determine if a particular file is already present on the central storage server. The file may be present as the result of a backup from another server or system, or from prior backup operations.*

*The decision whether to back up is performed file by file, instead of block-by-block for example. This strongly reduces the number of comparisons and the size of the local database, and is very well adapted to farm servers in which not only data blocks, but often complete files, are duplicated in several servers.*

This principle, identifying a 'blob' of data by a hash and then checking whether that hash already exists in a data store is a sound principle to also use for blockchains pruning and de-duplication. By definition blockchain nodes will contain the same data on all nodes that are considered to be part of the good nodes. For pruning purposes this data is meant to be stored elsewhere and on the blockchain node itself (which leads to `N` copies of the same data on all `N` nodes). The principle describe in the patent paper, to identify a chunk of chain data by a hash and then somehow (to be defined) checking this hash against all the participating nodes seems like a good consensus mechanism that all the `blobs` of data have the same content. After such proof has been created (and store) the data can be stored remotely is a (to be defined) smart manner.

If we take this principle and apply it to a blockchain and the pruning challenge then, identifying a 'blob' of data by a hash and checking whether that hash already exists in a data store is a sound principle to also use for blockchain pruning and de-duplication.  By definition blockchain nodes will contain the same data on all nodes that are considered to be part of the *good* nodes.  For pruning purposes this data is meant to be stored elsewhere and on the blockchain node itself (which leads to `N` copies of the same data on all `N` nodes).  The principle describe in the patent paper, to identify a chunk of chain data by a hash and then somehow (to be defined) checking this hash against all the participating nodes seems like a good consensus mechanism that all the `blobs` of data have the same content.  After such proof has been created (and store) the data can be stored remotely is a (to be defined) smart manner.

This technology is battle proven over the last two decades and provides a solid starting point for a blockchain pruning solution. We will come back to this later and use it to build a pruning system.
