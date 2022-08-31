## Process

### Step 1 : Consensus

The first step in the consensus protocol does not change: n nodes agree on validity of blocks. Once consensus is achieved (using whatever consensus protocol like PoS, PoW, ...) records are stored and deduplicated over all n nodes. 
With one difference, however, which is that the transactions are stored in a Z-Stor dedupe format, over p storage nodes + q redundant ones (typically 20% of overhead) in a Zero-DB format. 

### Step 2 : Fill block batch

We propose to group a number of blocks, either for an agreed number of blocks. Idea is to come to a sufficient volume to put aside (ex. 30 MB), and keep the transactional history on-chain as long as the agreed block number hasn't been reached. During this period, history is collected in n*(p+q) equal chunks of data.  

### Step 3 : Batch closing 

Once the agreed block number has been fully completed (= consensus achieved), the chunks are closed and are ready to be put off-chain. The zstor format ensures that data is immutable, a fingerprint is created and linking information to where the chunks can be found. This information is registered on-chain. 

### Step 4 : Off-chain storage follow-up

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
- In a permissioned model, the election of new chunk holders is part of the authority rights, and no incentive is to be foreseen. For permissionless models, an incentivisation mechanism needs to be worked out for every new election. 

#### How to split up the data chunks when a batch has just been completed ? 

At batch completion, there are logically n*(p+q) chunks available. However, this completed batch can't be pruned until the completion of the next batch, during which election happens of p+q 'historic chunk batch holders'. 
Number of chunks for every election needed is p+q, with p and q natural numbers and p>1, q>0. q=0 is not viable, as data rot might occur, so the idea is that there is always an objective to keep p+q chunks available, and when a chunks gets unreachable, a new chunk is being created.

The intention is to have (p+q) chunks available at any moment in time, for each batch, hence the re-election of every chunk for every new batch. The keeping of 1 or more of these chunks can be incorporated into the validator node code, but will require way less storage volume than the current full nodes. Moreover the storage can be kept off-chain, as an 'active' transaction archive. 

#### How to recollect the pieces if a historical transaction is to be recovered ? 

- In every of the y completed storage batches, all info is available as a transaction to recover y * (p + q) chunks, and with this info the full transaction history can be recovered, using y * p chunks and y * q spare ones. 
