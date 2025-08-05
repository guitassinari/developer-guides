# Why to separate applications running on a single node into multiple containers?

## It provides resource requirements isolation

Suppose you have a node running a web application and a configuration loader. The web application, as it serves HTTP requests to customers, has more resource requirements than the configuration loader. If the configuration loader is using all the resources of the node, the web application will not be able to serve requests to customers in an acceptable way (example: latency). Separating the applications into different containers allows you to allocate resources to each application based on its needs, as well as set rules regarding which application must be shutdown first in case of a resource shortage.

# References

- Designing Distrubuted Systems: Patterns and Paradigms for Scalable, Reliable Services by Brendan Burns.