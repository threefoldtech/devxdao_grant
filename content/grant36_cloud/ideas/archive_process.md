
- file gets moved to ZDB cluster (using zstor)
- ZDB cluster randomly chosen out of pool which is defined in blockchain
- ZDB cluster needs to be big e.g. 20 required from 60, so we can loose 40
- total pool size e.g 1000 = storage validators (need to think abour reward)
- link put on filesystem where the data is, the archived version with all required metadata
- metadata needs to be synced to each node, who can then decide to also remove that file or not
