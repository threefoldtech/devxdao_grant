
## Necessary conditions.

Taking the high level requirements into consideration we take the following necessary conditions on board to design the solution:

### **Necessary Condition 1 (NC1)**. *Secure, autonomous, decentralized and distributed data processing and storage utility*

To create autonomous, decentralized and distributed data processing and storage utility we need an operating system that provides maximum security by not allowing people to give it instructions or configure it.  To reach a distributed and decentralized grid of processing and storage capacity we cannot rely on people to install and operate standard operating systems.  A standard operating system would allow individual owners of these nodes to be able to see (and potentially manipulate) the incoming data parts to be stored.

ThreeFold has developed such an operating system that gets its instructions from a decentralized ledger where a smart contract governs the execution of such operational instructions.  Such an operating system would allow the compute and storage nodes involved in the pruning solution to be safe, private, sovereign and autonomous  in it's operations.

**Necessary condition 2 (NC2)**. *Immutable and always-append storage device*

Use a low level storage device that uses physical storage similar to how a blockchain create chain data: always append and immutable.  When data is committed to this storage device it cannot be deleted.  The data is committed and stored on this storage device for as long as this device is part of the storage system for pruned data.

**Necessary condition 3 (NC3)**. *Encrypted secure networking*

Use secure and encrypted networking between the blockchain nodes and the *remote* storage utility.  Chain data needs to be transported off node and we need to have certainty that data cannot be changed or messed with in the transport part of the pruning process. Therefore encrypted networking using an overlay network technology is an important component for taking chain data off blockchain nodes.

**Necessary condition 4 (NC4)**. *A storage system that presents remote storage to blockchain node*


All activities of storing data away from the blockchain node and creating the necessary proof points along the way should require minimal to no impact on the blockchain software.  

Proof point should include:
- authenticity of being pruned from a particular node
- comparing off chain data from different nodes to contain the same data
- de-duplicating data   
- other activities to condense the data footprint and make the whole blockchain more efficient and scalable

Some blockchain protocols have built in capabilities that allow partial backup of chain data and provide the required proof of the authenticity of the partial backup which makes the remote storage filesystem an ideal way to take data off-node.

**Necessary condition 5 (NC5)** . *Secure access to remote stored and de-duplicated data*

Provide secure access to the stored history of the chains and make all nodes (ideally) use de-duplicated copies of the historic data.

**Necessary condition 6 (NC6)**. *Proof of recoverability*

When data is stored off node in a de-duplicated format there should be a regular check if the pruned data is recoverable.  This necessary condition will also create the opportunity for new nodes to join at and start validating and securing from the current chain state while in the background cycling back the the genesis block on the pruned chain data and create proof of recoverability for the while chain. 

