# Server Side Caching Software Options

## Resources
- [Redis vs Memchached](https://www.youtube.com/watch?v=Gyy1SiE8avE)
- [Redis in 100 seconds](https://www.youtube.com/watch?v=G1rOthIU-uo)

## VoltDB
- Relational

## Redis
- Redis = "REmote DIctionary Server
- Could be a primary database as well
- Stores data in-memory and in-disk (for recovery)
- Key-value
- Submillisecond latency
- Feature rich values
  - String, bitmap, bitfield, hash, list, set, sorted set, geospatial, hyperlog, stream
- In-memory
- Fixed number of partitions + gossip protocol
  > What is a gossip protocol?
- Write ahead log
  - Allows atomic operations. Allows for easier recoveries.
  - Single thread to allow this
  - Single leader replication
  > What is leader replication

## Memcached
- Key-value
- Barebones, in-memory
- Can be distributed using a consistent hashing ring for partitioning
  - Same requests to the same hash => same data everyime
  - Consistent hashing minimizes the amount of migrated data on the addition/removal/replacing of nodes
- Multi-threading
- Least-Recently-Used eviction policy
