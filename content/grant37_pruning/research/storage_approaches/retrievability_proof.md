### Proofs of Retrievability

Nodes who agree to share the task of storing blockchain data have an interest in verifying that the data is in fact recoverable. 

To avoid the overhead associated with actually recovering the data, a compact computational proof may be used instead.

[These authors](http://www.arijuels.com/wp-content/uploads/2013/09/BJO09b.pdf) describe an algorithm based on erasure encoding and random sampling to generate such proofs.

There are multiple ways how proof of retrievability can be implemented as ThreeFold we have implemented a novel way how to do this without the overhead of what is described above.