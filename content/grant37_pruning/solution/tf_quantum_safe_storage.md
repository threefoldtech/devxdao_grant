> needs to be put in bigger context, more include from TF

####  ThreeFolds QSFS as a basic building block for blockchain pruning? 

QSFS stands for Quantum-Safe File System. It is a redundant filesystem, which can store petabytes of information.

Unique features are : 
- Unlimited scalable (many petabytes) filesystem
- Data is spread over many devices owned by different, independent hardware owners called farmers. Together, these farmers provide the capacity to a hardware grid, call the ThreeFold Grid. 
- Dispersion over multiple sites ensures 100% privacy of the data, as no farmer knows what the data is about (zero knowledge storage system). Even a quantum computer cannot decrypt the data on a node, as one node contains insufficient information to unambiguously recreate the authentic data.
- Data can’t be lost: there is a protection for datarot, data will auto-repair.
- Data is append-only and immutable by design of the protocol, so it’s fit for storing ledger history. Even with sites going down, data is not lost with ‘operational’ backup nodes in place.
- Up to 10x more efficient than storing on classic storage cloud systems. Overhead of about 20% is sufficient to have a secure archive.
- Can be mounted as filesystem on any OS or any deployment system (OSX, Linux, Windows, Docker, Kubernetes, TFGrid, ...).
- It is compatible with +/- all data workloads (exception: high performance data driven workloads like a database).
- Self-healing: when node or disk lost, storage system can get back to original redundancy level.
- Helps with compliance to privacy regulations like GDPR (as the hosting facility has no view on what is stored, information is encrypted and incomplete).
- Hybrid : can be installed onsite, public, private, ...
- Read-write caching on encoding node (the front end).

#### ThreeFold QSFS sub-components

QSFS being a prime candidate to consider for blockchain pruning purposes has a number of sub-components that can be put to use for achieving the pruning solution.  Here's a brief description of some of these:

##### 0-db storage engine

This is an always-append database, which stores objects in an immutable format, which allows to have history out-of-the-box, good performance on disk, low overhead, easy data structure, easy backup (linear copy and immutable files).
We use two types of 0-db: 
- One for the storage backend 
- One for 0-db-fs, which is where data needs to be, to be available via the fuse filesystem. This 0-db can offload its data to an external process (user-defined) and can also request missing data to be retrieved, if some data are missing.

This enables the database to spread and not always use local storage space if data is not read.

One external process to handle these cases is 0-stor-v2.

##### 0-db-fs FUSE layer which uses the storage engine in an optimized way

This is a simple filesystem driver which uses 0-db as the primary storage engine.
Directories and metadata are stored in a dedicated namespace, file payloads are saved in another dedicated namespace.
The filesystem uses an internal cache system made, not for performance, but to optimize how data is stored in the 0-db, to avoid overhead as much as possible.

##### 0-stor-v2 engine to save/backup data to safe location

This tool can be used as external process for 0-db, or can be used for any purpose. It just takes one file as input, it encrypts this file in AES based on a key user-defined, encodes the file and spreads the data to multiple 0-db’s. Based on the policy (configurable), some amount of 0-db’s can be unreachable, data can still retrieved and missing database can even be rebuilt to keep full consistency available.

Metadata needed to get data back from 0-db in the right order, are stored in others 0-db.

