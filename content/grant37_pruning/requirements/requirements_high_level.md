

## High level requirements

- archive (prune)
    - only keep relevant blockchain data on the validator nodes itself, old data should be archived (pruned)
- caching
    - caching of data (only retrieve relevant information when needed)
    - seamless caching is required, this means that a blockchain node only fetches the data blocks when required
- data deduplication
    - make sure data is never stored twice on backend system
- proof of recovery
    - the pruning solution should store the chain data such that it provides a proof of recovery method 
- redundant archive storage paths
    - need to make sure that data can always be stored and cannot be stopped by indivual parties (e.g. hackers)
- node operators can choose how much is archived
    - the pruning solution should allow node operators to *opt in* and *opt out* of using it.
    - amount of caching can be selected
- self repear
    - make sure if data gets corrupted or there are missing data pieces the data get's repaired automatically


