### Erasure encoding for blockchains

Erasure coding means a mechanism that data gets cut into pieces so that less overhead is required to store information over multiple disks.

Erasure coding is a simple form of "forward looking error correcting codes"

The question of applying erasure encoding to blockchain data in order to reduce the storage requirements of individual nodes has been explored in this [paper](https://arxiv.org/pdf/1805.00860.pdf). 

The authors conclude that such an approach can provide strong assurance of data correctness without large computational overhead.

We believe this is a very elegant way and should be done but care needs to be taken for

- if using erasure coding technologies like reed solomon, there is a possiblity to loose data (also called the raid5 hole)
- order of operation is still important in reed solomon
- there is not that much flexibility in data positioning and systems can be rather fragile if not done properly especially in networked environments

We as threefold are a big proponent of this approach if done properly.

