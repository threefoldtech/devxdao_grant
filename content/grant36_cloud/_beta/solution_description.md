## Solution

Blockchains bring very useful capabilities (immutable and always append) allowing decentralisation of many existing phenomena/things/services.  Blockchains allow for governance of "a thing" without having a (centralised) governance body.

![blockchain generic](../img/blockchain-generic.jpg)

Governance and consensus for a blockchain is achievable if the full history of the existence of the blockchain is kept in :
- a large number of locations that are unsecured (permissionless) - fully decentralised operation is possible here.
- a small number of locations that are highly secured (permissioned) - fully decentralised operation is _not_ possible, central governance needed to run the persmission scheme.

In both situations the safety and reliability of decentralised (or less centralised) governance structures comes from storing a large number of "immutable" copies of the (blockchain) data on nodes in many locations. A "consensus" mechanism make sure the same data is written to all participating nodes.  

So the elements making a blockchain reliable and secure are:

1. the blockchain software cannot change historic data, it can only create new data.
2. many blockchain nodes write the same data to a local disk which results in many copies of the same data. Changing the history of a blockchain therefore means changing many datasets simultaneously.
3. in order to change the data on blockchain nodes you need to get access to the OS running the blockchain software and start changing the data from the OS or change the blockchain software to insert malicious code that allows historic changes to be made to the data.

Doing all of the above provides good security for blockchains by creating immutability.

[Solution Components](solution_components.md)
[Solution Process](solution_process.md)
