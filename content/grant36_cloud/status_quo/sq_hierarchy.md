
### A hierarchy of nodes

Another way to overcome this issue is to have a blockchain split the full chain process (workload) into subprocesses. Each subprocess can now be worked on by specific type of nodes that are tailored to operate that one part of the process.  Examples are:
  - Transaction nodes: a node that only provides transaction capabilities and possibly store the results
  - Validator nodes: nodes that look at the transaction nodes and validates transaction through some sort of consensus mechanism
  - Core/full nodes: nodes that store the full chain history and are authoritative for chain content 
  - Edge nodes: remote nodes that perform edge transaction in a fast and efficient way.  There has to be some form of synchronization between edge nodes and core/full nodes.

By creating different nodes type the requirements for storage per node (type) are lowered.

**SWOT analysis** 

| *Strengths* |
| :------------ | 
provides independent scalability between different functions / processes off the full chain.|

| *Weaknesses* |
| :------------ | 
| Overhead is created by relying on the network to communicate between the different functions/subprocesses. Network speed might effect overall performance on the chain |


| *Opportunities* |
| :------------ | 
| when required subprocess's can easily be broken up into smaller pieces when needed or vice versa integrated into large components.| 

| *Threats* |
| :-----------|
| Many different components have network interfaces and there are is a realistic chance that hackers might attack the network interfaces from the different nodes.|