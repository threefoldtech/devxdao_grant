## Repository

Latest version of the content should be in the `development` branch, updated at least daily.  All contributors to work in their own branch and do a pull request after making some significant updates.

## DEVxDAO GRANT Proposal #37

ThreeFold tech applied for grants with the [DEVxDAO](https://www.devxdao.com/) organisation, received approval, and contracts have been signed. There are two grants in total. This repo deals with the research and POC work with regards to grant #37. See also [grant #36](https://github.com/threefoldtech/grant36).

## Trusted data lake for Casper events

### Explanation of Benefit
If successful the project will bring a new scaling opportunity for level-1 protocols to execute value transactions and smart contracts. The current technological reality is that level-1 blockchains will carry forever their history which will put an increasing demand on storage requirements for participating full nodes retaining a complete copy of the chain. This is not very sustainable and efficient. Furthermore, it effectively leads to centralization by limiting the number of network participants which have the resources to deploy adequate storage capacity to run a full node.

Possible solutions may defer the problem into the future (compression) or require complex structural changes to the protocol itself (different node subprocesses/roles). The question we propose to address is, how can nodes participate in consensus and the maintenance of a full blockchain without needing to store a complete redundant copy of the chain? Many protocols already offer "pruning" features within their node software, so that while the full chain is downloaded and verified, only the newest blocks are retained. These nodes are able to participate in consensus and provide a secure way to interact with the network, but they offer limited beneift in the maintenance of the chain.

Implementations and deployments of systems like DAOs that rely on blockchains for data storage is expected to grow exponentially. In order for these systems to remain secure and truely decentralized, a solution is needed to reduce redundant storage requirements and associated overhead.

### Milestone #1

#### Milestone title
Initial pruning research document

The portion that the OP is requesting from the total grant for the milestone: 100000

#### Details of what will be delivered
Layer-1 blockchain pruning is key to it's growth and applicability to any DAO growth. Initial research will be done with the Casper Labs Layer-1 protocol.
#### Acceptance Criteria
[Research document with findings](./src/milestone_1/README.md)

### Milestone 2

#### Milestone title: 
Build proof of concept based on the research document

The portion that the OP is requesting from the total grant for the milestone: 400000

#### Details of what will be delivered:
the finding and recommendation in the research document will be translated into a working proof of concept which will demonstrate the findings and proof a pruning mechanism workable solution.

#### Acceptance Criteria:
being able to prune the layer-1 blockchain and keep the layer-1 protocol sustainable, small and efficient.


## enabled with publishingtools

How to use gitpod see publishingtools documentation https://library.threefold.me/info/publishtools
