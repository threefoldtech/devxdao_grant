## Solution Components

In order to create an architecture that can store historical blockchain data and allow the blockchain nodes to have a portion local to the node and the largest part of the history of the chain in a remote storage facility (pruning) we see the following key elements to innovate on:

1. *Secure and autonomous Operating System* : 

Use an operating system that provides maximum security by not allowing people to give it instructions.  Use an operating system that gets its instructions from a decentralised ledger and a smart contract that governs the execution of these instructions.

2. *Immutable and always-append storage protocol*

Use a low level storage protocol managing a physical storage device that acts like a blockchain: always append and immutable.

3. *Encrypted secure networking*

> (maybe to be deleted, as there's not really data to secure when pruning)

Use (ideally) secure (encrypted) networking between the blockchain nodes and the storage facility.

4. *Filesystem that presents remote storage to blockchain node*

Minimal to no impact to the blockchain nodes, the off node storage facility should be presenting itself on the blockchain node as a normal filesystem.

5. *Secure access to deduplicated data*

Provide secure access to the stored history of the chains and make all nodes (ideally) use deduplicated copies of the historic data.

With these elements we should be able to build a secure off node storage space for all nodes and then devise a method to check the integrity of all stored chani data and deduplicate it to a degree to have less copies stored forever.

### Secure and autonomous Operating System

The principles to build a secure and autonomous operating system to build a decentralised and distributed grid of capacity are as follows:

- *Autonomy*: to create compute, storage and networking capacity everywhere you can not rely on a remote (or a local) maintener of the operating system. Also owners should not have to be operating system administrators.  By makiung the OS autonomous and not allowing owners or systems admninistrators to log in to the OS you make it a very secure operatig system.
- *Simplicity*: An operating system should be simple, able to exist anywhere, for anyone, good for the planet.  Simplicity also enhances the overall secutity of a system 
- *Stateless*: In a grid (Peer To Peer) set up, the sum of the components is providing a stable basis for single elements to fail and not bring the whole system down. Therefore, it is necessary for single elements to be stateless, and the state needs to be stored within the grid.  

![zero-os-architecture](./img/threefold__zero_os_overview.jpg)

Building an autonomous, simple and stateless OS is not an easy feat.  Not having access means that is has to be 100% right at time of deployment.  Zero-OS has been developped and improved over the last 5 years and is now ready to be the capacity generator for secure IT workloads where compute, storage and networking components interact.

### Immutable and always-append storage protocol

In such a autonomous operating system storing data can be done in a very secure manner.  As owners, administrators and users to not have direct access to the operating system a very secure environment is created to runn applications and store data.  Also since this operating system is made to form a grid creating ubiquitous compute, storage and network utility local storage devices can be used to make a "dispersed" storage system.

At the foundation of such a dispersed storage system sits a zero-DB.
Zero-db is a fast and efficient key-value store (redis-protocol compatible), which makes data persistent inside an always append datafile, with namespaces support.  This zero-DB is able to receive and send information over the secure network that spans between alll the zero-OS's and as such many zero-DB's can together create a large storage lake.

The Zero-DB stores data like a key-value store, and can operate (when configured to do so) to store data sequatially which makes it an "always append" storage device.  For caching purposes it can also be configured to not do this.

![zdb-architecture](./img/threefold__zdb_arch.jpg)

### Encrypted secure networking: the planetary network

The planetary network is an overlay network which lives on top of the existing internet (or any other network created). In this network, everyone is connected to everyone. End-to-end encryption between users of an app the zero-OS's these applications run on.

Each user and network point is strongly authenticated and uniquely identified, independent of the network carrier used. There is no need for a centralized firewall or VPN solutions, as there is a circle based networking security in place.

Benefits :
- shortest possible paths between peers, independent of the network providers routing decisions
- end-to-end encrypted data transport create full security
- peer2peer links like meshed wireless
- broken internet links do not affect the operating of traffic by re-routing traffic when needed

![planetary-network](./img/threefold__planet_net_.jpg)

### Filesystem that present remote storage to blockchain node

Quantum Safe Storage System uses a dispersed storage algorithm to distribute the data in a smart way and stores data in different locations. The original object is fragmented, compressed and encrypted, and than a "description" is created of that compressed and encrypted data part which is stored. The original compressed and encrypted data is deleted.  Only that description of that data part  of the information is stored, making it impossible to understand what data(part) is stored on a single device as you need all the descriptions together to be able to "un-describe" the compressed and encrypted original data

The data is described in a way such that a person aiming to hack into the low-level data (which is almost impossible in itself), will only find non-relevant information on this storage infrastructure and the other data shards can’t be re-created, making it quantum-proof.

Quantum Safe Storage System offers the following storage benefits:

- Store Petabytes of data at hyper-competitive pricing.
- Quantum-safe security (not even a quantum computer can hack).
- A filesystem interface see Quantum Safe Filesystem
- Unlimited scalability provided by the ThreeFold P2P infrastructure.
- Self-healing capability of the storage layer ensures your data remains available at all times.

![dispersed-storage](./img/threefold__zos_zstor.jpg)

### Secure access to deduplicated data

...