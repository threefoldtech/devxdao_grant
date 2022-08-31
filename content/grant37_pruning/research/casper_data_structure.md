
# Casper uses LMDB

CasperLabs uses [LMDB](https://medium.com/casperlabs/casperlabs-releases-node-0-3-c3a1adb2d645) which provides some features we can tap into to provide pruning support.

LMDB is a big file on a filesystem and as such its hard to use some storage tricks on the quantum safe filesystem to implement pruning on that level.

To succeed with pruning on casperlabs we have to integrate in the storage layer itself, probably in the code of casperlabs itself which complicates this project.

### Lightning Memory-Mapped Database Manager (LMDB)

*LMDB is a Btree-based database management library modeled loosely on the BerkeleyDB API, but much simplified. The entire database is exposed in a memory map, and all data fetches return data directly from the mapped memory, so no malloc's or memcpy's occur during data fetches. As such, the library is extremely simple because it requires no page caching layer of its own, and it is extremely high performance and memory-efficient. It is also fully transactional with full ACID semantics, and when the memory map is read-only, the database integrity cannot be corrupted by stray pointer writes from application code.*

*The library is fully thread-aware and supports concurrent read/write access from multiple processes and threads. Data pages use a copy-on- write strategy so no active data pages are ever overwritten, which also provides resistance to corruption and eliminates the need of any special recovery procedures after a system crash. Writes are fully serialized; only one write transaction may be active at a time, which guarantees that writers can never deadlock. The database structure is multi-versioned so readers run with no locks; writers cannot block readers, and readers don't block writers.*

*Unlike other well-known database mechanisms which use either write-ahead transaction logs or append-only data writes, LMDB requires no maintenance during operation. Both write-ahead loggers and append-only databases require periodic checkpointing and/or compaction of their log or database files otherwise they grow without bound. LMDB tracks free pages within the database and re-uses them for new write operations, so the database size does not grow without bound in normal use.*

*The memory map can be used as a read-only or read-write map. It is read-only by default as this provides total immunity to corruption. Using read-write mode offers much higher write performance, but adds the possibility for stray application writes thru pointers to silently corrupt the database. Of course if your application code is known to be bug-free (...) then this is not an issue.*

See on internet: [LMDB](http://www.lmdb.tech/doc/index.html)
