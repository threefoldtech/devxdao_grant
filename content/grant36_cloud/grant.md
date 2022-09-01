![](img/casper_devxdao.png)  

# Grant

- Received Grant Before: No
- Grant amount total; 500k
- Grant Id: 36
- Completion: 100%
- User Id: 168 (maybe this should be relocated)
- Company or Organization: ThreeFold

## Benefits

<!-- If successful the project will bring new scaling opportunity for level-1 protocols to execute value transactions and smart contracts. 

Problem: the current technology reality is that level-1 blockchains carry forever it's history which will put an increasing demand on storage requirements for all participating nodes. This is not very sustainable or efficients.

The number of implementations of DAO's is going to be exponentially growing and there is a need for level-1 blockchain protocols to be able to deal with the increased volume of transactions and history where pruning is going to be needed.

Our Solution is

- Thin provisioning can deploy blockchains with at least 3x storage requirements and bandwidth requirements for intial deployment (done)
    - Thin provisioning works for most blockchain systems, this has now been proven. (done)
    - Further integration storage backend of casperlabs would benefit even more. (next grant)
- Pruning support for blockchains 
    - Show how a solution can be created using ThreeFold storage components (is using 30 years of experience)
    - Demonstrate applicability
    - Create specs & solution upto to a pruning DB which can then be used in a next grant to integrate tightly in casperlabs DB

> The result of this grant are massive important for the blockchain industry, storage is a big issue. -->

## Our Team has massive experience in storage & internet technology

- first data deduplication system in the world for datacenters & backup (acquired by veritas/symantec) (2002)
- first always consistent distributed key value database in the world https://dbdb.io/db/arakoon (2010-2015)
- first proof of blockstake blockchains in the world (was called Rivine, discontinued because of lack of funds)
- first distributed storage system based on forward looking correcting codes (see Amplidata, used by major governments), scales to zetabytes
- probably first and super high performance always consistent disk volume driver on top of Arakoon and Amplidata, we were able to demonstrate 10.000.000 IOPS in 1 rack back in 2013
- first distributed block based storage system on top of Infiniband for ZFS (was done just before we were acquired by SUN microsystems)
- major world records in relation to hosting of very big internet sites (1998-2000) with global loadbalancing and caching at a time this was not done yet

> We are delighted to use this expertise for the benefit of the world and are grateful for the chance devxdao gives us to develop and contribute even more.


## Milestone 1 (100% done) = 250k USD

>TODO: fix

- Milestone title: Create the ability to run layer-1 blockchain nodes on the ThreeFold Technology grid.
- 
- The portion that the OP is requesting from the total grant for the milestone: 
    - USD 250.000 (was $100k originally)
- Due date: 
    - done
- Details of what will be delivered:
    - prove Layer-1 blockchain thin provisioning can be done (this is a massive achieved and has incredible benefits for the industry)
    - Initial research will be done with the Casper Labs Layer-1 protocol and also some other blockchains.
    - Create the solution which allows everyone to verify thin provisioning can be done.

> remarks: we were an early grant and were trying to get feedback before submitting because there was no clarity for us how to do it and how sure we would be on the grant. We might have been not good enough in our communication, but the grant got removed before we could receive funding for the work done. We hope that this might be recovered, as such we have updated this document to reflect our current situation and work done.

### Acceptance Criteria:

> we hope that the reader can see how this work has an incredible potential for the blockchain industry. We have been able to show how blockchains can be deployed using more than 5x time and bandwith benefit, this shows the potential of how pruning & thin provisioning migh be achieved.

- [X] thin provisioning solution can be deployed (based on pokt.network for now) and can be done by everyone
- [X] see how the thin provisioning cuts heavily on bandwidth and storage requirements (5x benefits easy to achieve)
- [X] deploy a large blockchain in less than 1h which would have taken days before
- [X] all required code to allow everyone to experiment (see pokt.network in research)
- [X] all code is opensource (threefold as well as the deployers for thin provisioning)
- [X] research for industry, different approaches around thin provisioning & pruning (see research part of document)
- [X] define solution which allows implementation for pruning for casper labs
- [X] do detailed research about casper labs to see how integration can be done (and if): our conclusion it can be done
- [X] link to required technology parts as provided by ThreeFold, see if we can use those solutions and what benefit would be
- [X] do all required work to let it work on ThreeFold Grid

## Milestone 2 (ready to be executed) = 250k USD

>TODO: fix

 implement all required components for base system as defined in [solution part of doc](../solution/solution.md)

### Acceptance Criteria:

We have been able to leverage a lot of technology from Threefold Tech which has been developed over the last 10 years. This grant was all about making sure and improving this codebase so it can be used for casperlabs. This is the result of hundreds of manmonths for which we are delighted to receive some recognition in a form of a grant.

- [X] zdb with all required features as required for the prune DB (opensource)
- [X] zdb storage containers
- [X] caching capability if the technology
- [X] FLECC codec implemented and available as golang code (opensource)
- [X] ZDB storage containers caching & encoding with FLECC codec.
- [X] FLEXX encoding & distribution to 20+ backends
- [X] self healing on the data, prove that data cannot be corrupted
- [X] automatic recovery of broken ZDB instances on nodes
- [X] deployment system on top of TFGrid 
- [X] metadata system
- [X] read path is redundant, can come from multiple ZDB backends
- [ ] better description of the solution
- [ ] documentation and make demonstration tutorials in text and video
- [ ] document all links to code & scripts as used on above


{{#include grants_future.md}}

