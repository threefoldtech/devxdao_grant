
## Purpose: Initial pruning research document

Layer-1 blockchain pruning is key to its growth and applicability to any blockchain and/or DAO growth. Initial research will be done with the CasperLabs layer-1 protocol.
If successful, the project will bring new scaling opportunities for level-1 protocols to continue to execute value transactions and smart contracts without performance loss for ever. The current technological reality is that level-1 blockchains will carry forever their history, which will put an increasing demand on storage requirements for participating (full) nodes retaining a complete copy of the chain. This is not very sustainable and efficient. Furthermore, it effectively leads to centralization by limiting the number of network participants which have the resources to deploy adequate storage (and to a lesser extend compute) capacity to run a full node.

Possible solutions may defer the problem into the future (compression of data) or require complex structural changes to the protocol itself (different node sub-processes/roles or sharding). The question we propose to address is:  "How can nodes participate in consensus and the maintenance of a full blockchain without needing to store a complete redundant copy of the chain data locally?".

Many protocols already offer "pruning" features within their node software, so that while the full chain is downloaded and verified, only the newest blocks are retained. These nodes are able to participate in consensus and provide a secure way to interact with the network, but they offer limited benefit in the securing and maintaining of the chain.

Implementations and deployments of decentralized systems like DAOs rely on blockchains for smart contract and transaction storage are expected to grow exponentially. In order for these systems to remain secure and truly decentralized, a solution is needed.