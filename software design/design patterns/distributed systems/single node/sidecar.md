# Sidecar pattern

- Single node pattern composed of two containers: the application and the sidecar.
- The sidecar is responsible for augmenting the application container with additional functionality, often without the application's knowledge.

![sidecar pattern](./images/sidecar.png)


## Implementation

- Coscheduled into an atomic "container group" (example: `pod` API in Kubernetes).
- Share resources like filesystem (or part of it), hostmand, network...

## Use cases

- Applications that are difficult to change/maintain (legacy codebases).
- Examples:
  - HTTPS termination
  - Configuration Synschronization

![sidecar pattern](./images/sidecar_https_termination.png)
  

# References

- Designing Distrubuted Systems: Patterns and Paradigms for Scalable, Reliable Services by Brendan Burns.