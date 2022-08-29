# Offload blockchain databases

I've made some test with Harmony Blockchain (testnet) to try to reduce bandwidth requirement to get a working node running quickly.

## Setup

In order to get a node working, documentation ask you to clone a copy of the current blockchain database state using `rclone` and
grabbing data from a `AWS` storage source.
I did it on my machine with a `400 Mbps` download line, it took **50 min** to download the whole `40 GB` database (testnet), which make an average
download speed of `14 MB/s`.

I've put a copy of that database into a local `zdbfs` and mounted an overlayfs on top, then used that overlayfs as endpoint for Harmony database.
With this approch, Harmony will read data from `zdb/zdbfs` but write changes into a classic local storage space, `zdbfs` is thus used as read-only source
and local space will only be used when required (updated files).

## Numbers

The database get cloned **4 days** before the day I did the real test, let's assume database was **up-to-date** when cloned, when running the node,
it would need to sync **4 days** of new data. When starting the node with local classic storage with the database, node boot up in **~15-20 seconds** (on `SSD`).

When using `zdbfs`, node boot up in **~30 seconds** and read about `15 GB` of data from `zdbfs` before being ready. Overlayfs at that time is nearly empty, it act more
like a passthru to `zdbfs`. After **2 days**, Harmony were fully synced and `1.5 TB` were read from zdbfs. Local storage space used is about `11 GB`.

More test will be made to get better values and more deterministics details, theses values were fetched from `zdb` statistics at differents day moment.

## Benefits

According to theses values, an average bandwidth of `10 MB/s` is required between the node and `zdb` where database is, with only `1 zdb` in a local network sharing the database
we can feed lot of node without the need to copy the full database locally, since after **couple of days** running, only `15 GB` of data were allocated on the node itself, this __reduce the storage needed by 4 per node__ and any node can boot in less than **1 min**.
