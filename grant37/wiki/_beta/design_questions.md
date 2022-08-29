## Design questions and criteria for blockchain pruning

- [ ] Is this a solution for all BC nodes?
- [ ] POA (authority) -> permissioned .  easy - forced to  use the "pruning" solution
- [ ] != POA -> permissionless.  Incentive -> overall cost + effort lower

- [ ] blockchain node software run on the TFGrid
- [ ] blockchain node software run on a arbitrary linux OS
- [ ] blockchain node uses local storage to store chain data?
  - [ ] pruning takes data from local store and pushes it to remote storage
  - [ ] pruning leaves some (recent) chain data on the node
- [ ] blockchain node uses remote storage to store chain data?
  - [ ] remote storage deduplicates the chain data and stores proof of deduplication of chain data
  - [ ] remote storage services multiple blockchain nodes with (historic) chain data

* participant decides all data off node or partial.

  
- remote storage has all the `n` copies of chain data for all the `n` nodes
- process / software is running that compares all `n` copies of the data and create proof of:
   - all n blockchain nodes have chaindata.  Create hash of the original chain data of node `n`
   - create a unique hash / sign (one key pair per node `n`) of the chaindata and node `n` identifier
   - store all `n` unique hash / signed verifiers such that proof exists that all `n` nodes had the same chain data
- randomized process decides to keep `x` copies out of `n` copies and throws `n-x` copies out.
- 
- proof + `x` copies are stored permanently and kept to represent the chain history.

## Chain data is parted:  some stay on node and some is stored remotely
- blockchain software runs on TF Grid (z-machine), bare metal linux or linux VM
- base OS has local storage (volume) and remote storage (quantum safe storage) mounted
- blockchain software writes chain data on local storage
- pruning process look at local written chain data and based on set criteria creates
- `head -n -100 /var/log/chaindata > /var/log/chaindata_pruned ; cp /var/log/chaindata /mounted_remote_storage ; mv chaindata_pruned chaindata`
