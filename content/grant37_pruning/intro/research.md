# Research Intro

This research document represents the first milestone in the grant that has been awarded by DEVxDAO. This document will lay out the challenges that need to be overcome to create a lasting generic solution for the blockchain forever growing data storage problem and then identifies solution paths to this challenge. This document will present a number of solution paths to be looked at and then, as a conclusion, a proof of the solution will be implemented in milestone 2 of this grant.  

Extensive research has been done by a group called ThreeFold into creating a decentralized technology with compute and storage capabilities to build a new internet that is not in the hands of a few monopolies. This research is centered around a solid "layer-0" software stack and we intend to put it to work in conjunction with new innovation to find a decentralized autonomous solution to the blockchain pruning problem.

This research document will look at publications and literature to see what history has taught us how to deal with growing datasets and increasing importance of digital data. Areas that will be investigated are the well known area of backups (full and incremental) and archiving. Another area which might get us some insights is de-duplication of data before it is archived or backed up. Also, we will look at other publications describing research or projects about finding a (partial) solution to the pruning challenge.

The biggest work is to test the algorithms available to ThreeFold for a blockchain like Casperlabs and see if benefits can be achieved.

After reviewing what has been developed, implemented and proposed as solutions, we will present a number of methods by which we believe we can get to an acceptable pruning solution. We will present SWOT analyses on the methods presented and select the few that are most feasible to get to the required result.

Pruning is not the only solution to the data problem, thin provisioning is as important. Thin provisioning means that not every blockchain needs to sync all available information. 

The selected methods will then be architected to a level where we can see how this would work in a real life situation and what is required to achieve this. Recommendations for the second milestone will be presented and risks and limitations will be cited.  


## Purpose: thin provisioning & pruning research

Layer-1 blockchain pruning is key to its growth and applicability to any blockchain and/or DAO growth. Initial research will be done with the CasperLabs layer-1 protocol.
If successful, the project will bring new scaling opportunities for level-1 protocols to continue to execute value transactions and smart contracts without performance loss for ever. The current technological reality is that level-1 blockchains will carry forever their history, which will put an increasing demand on storage requirements for participating (full) nodes retaining a complete copy of the chain. This is not very sustainable and efficient. Furthermore, it effectively leads to centralization by limiting the number of network participants which have the resources to deploy adequate storage (and to a lesser extend compute) capacity to run a full node.

Possible solutions may defer the problem into the future (compression of data) or require complex structural changes to the protocol itself (different node sub-processes/roles or sharding). The question we propose to address is:  "How can nodes participate in consensus and the maintenance of a full blockchain without needing to store a complete redundant copy of the chain data locally?".

Many protocols already offer "pruning" features within their node software, so that while the full chain is downloaded and verified, only the newest blocks are retained. These nodes are able to participate in consensus and provide a secure way to interact with the network, but they offer limited benefit in the securing and maintaining of the chain.

Implementations and deployments of decentralized systems like DAOs rely on blockchains for smart contract and transaction storage are expected to grow exponentially. In order for these systems to remain secure and truly decentralized, a solution is needed.