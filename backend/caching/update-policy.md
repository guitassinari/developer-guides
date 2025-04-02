# Update policies
## Resources

- [Cache strategy in backend](https://medium.com/@genchilu/cache-strategy-in-backend-d0baaacd2d79)

## Write-through
  - Updates the DB and cache at the same time, allowing strong consistency
  - Increases write time
## Write-around
  - Updates the DB and invalidates the cache.
  - Can cause several cache misses when beginning to read
## Write back
  - Only updates the cache. Later updates the DB.
  - Improves latency and throughput
  - Might lose data if system goes down before DB is updated.