# Suggestion Solution

Implementing good enough pruning for Casper Labs is not a trivial task.

We believe that we have to put it in 2 phases, 1 phase is for research and proof of concept which can be used generically and proves the concept of a global pruning layer.

The 2nd phase should be for another grant of other collaboration effort to put it inside the storage engine of Casper Blockchain and work closely together with the engineers of Casperlabs.

## Phase 1 Solution (this grant)

A pruning DB, writing on global level to hundreds of backends in such a way the performance stays high, the data cannot be corrupted, the data can be self-healed when needed. Demonstrate how a pruning DB can be a super efficient backend storage layer for a blockchain like Casper Labs.

**Solution see [architecture](architecture.md)**.

### Proof Points

- create a global accesible data lake for a blockchain which is deployed in 100 locations and only 20 nodes are needed to retrieve the data.
- Prove that 80 nodes can be offline and data can still be retrieved.
- Prove that 100 TB of data can be stored this way using 1 Pruning DB.
- Make test scripts which show how performance is high for the key value stor and stays high independent of size of DB. We will test with 100 TB.
- Show how multiple Prune DB's at the same DB can read the data when not in cache from the same data lake.
- prove that 100 MB/sec can be achieved towards backend (if enough bandwidth available)
- show how data gets encrypted and distributed in such a way that even for a serious hacker it would be hard to do something with the data.
- this effort goes together with another grant which is the deployment of such a system on top of TFGrid in all scalability and with a consensus driven deployment mechanism.
- All the code delivered is opensource.

## Future Grants

### Integration in Casperlabs Blockchain Backend

- show how seamless pruning can be implemented in POC using the blockchain engine
- this is a serious job and will require quite some effort to make sure it happens in the safest way and gets well tested.
- this will require low level integration so that the data paths dont change to much.
- Use the Blockchain layer to also prove authenticity of the pruning storage layer (is an extra check, not strictly needed, but might give extra confidence to community).

### Production Readyness & Testing

Testing this new pruning layer in all its facets on performance and reliability level.

### Master-Slave Solution for pruning DB

- Make Pruning DB Redundant (active-active or active-passive)
- Show how there is never a reliability issue, create good test cases to show this redundancy.




