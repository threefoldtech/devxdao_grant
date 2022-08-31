### Impact

Benefits of this protocol, compared to the classic blockchain protocols, is the following: 

- Volume increase is a multifactor lower: instead of fully deduplicating the ledger, with all its transactions, over tens or hundreds of nodes, data is deduped intelligently over these nodes, using intelligent redundancy. 
- The built-in redundancy allows for relatively more nodes to go offline without loosing the full information, up to a predefined threshold.
- The number of nodes able to participate in the archiving process is unlimited and can be changed over time (minimum, maximum). 
- History is stored in an externalised process. The separation between the operational consensus process and storing of the history in the same unit of work, at the moment of consensus, makes the transaction history management way more clean. 
- Historic transactions are written as immutable storage into a 0-db, is added to the ledger using an append-only process. 
- 0-db's contain a timestamped chunk of storage, allowing the recovery of (part of) the history