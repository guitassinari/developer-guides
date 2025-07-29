# CDN

Content Delivery Networks are distributed groups of servers that cache and serve content to users faster by ensuring those contents are being sent from the closest server available to them.

The types of assets can be:
- HTML files
- JS files
- CSS stylesheets
- images
- videos
- Others
  

## Benefits

- Improved website load times by caching content near the end customer.
- Reduced bandwidth costs as the content isn't delivered by the website hosting anymore, but rather through the CDN.
- Increased content availability and redundancy due to the distributed nature of CDNs
- Improved website security by helping prevent DDoS Attacks due to the distributed nature of CDNs, preventing a single server from being hit and denied. Also, caching, rate limiting and filtering features can help reduce the load on the website.

## How does it work

CDN networks are composed of multiple servers placed strategically accross the globe an connected to IXPs (Internet Exchange Points) to provide high speed data delivery and reduce transit times and costs. Also, CDNs focus on optimzations on hardware and software and strategic placement of its Data Centers to provide the best security and reliability.

### Latency improvement

Usually achieved through:

- Hardware optimizations like the use of SSDs
- Software optimization like efficient load balancing
- Minification and file compressions for quicker transit times.
- Reusing connections by using TLS/SSL certificates and TLS false start (TODO: What is falst start?)

## Resources

- https://www.cloudflare.com/en-ca/learning/cdn/what-is-a-cdn/
- https://www.cloudflare.com/pt-br/learning/cdn/performance/