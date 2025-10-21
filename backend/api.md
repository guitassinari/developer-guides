# API

Application Programming Interface.

It defines a set of definitions and protocolos that allows different softwares to communicate with each other and access their features.
In a backend webdevelopment context, it is usually composed of a set of endpoints (URLs) that can be accessed using HTTP methods (GET, POST, PUT, DELETE, etc.) to access data or perform actions.

The way an API is structured can be different and there are a few popular ways to structure an API, such as REST, GraphQL, and gRPC.

## REST

A REST API (Representational State Transfer) is an API style that uses HTTP methods alongside a resource-based URL structure and the HTTP headers and body to provide a way to access and manipulate data.

An API must follow a few restrictions in order to be considered REST:

- Uses a client-server architecture.
- Requests are stateless, meaning they contain all the information needed to be processed.
  - This improves visibility (a monitoring system only needs to look at the request to determine it's nature), reliability (easier to recover from partial failures), and scalability (no state between requests => less resources).
- Cacheable, meaning the server can determine which resources can be cached by the client or not, improving performance.
- Uniform Interface:
  - Identification of resources through URIs
  - Manipulation of resourses through these representations: Use HTTP standards (GET, POST, PUT, DELETE, etc.)
  - Self-descriptive messages: MIME types and standard RDF vocabs.
  - Hypermedia as the engine of application state (HATEOAS): Resources contain links to other resources, allowing the client to navigate the API.

### Resources

- https://stackoverflow.com/questions/25172600/rest-what-exactly-is-meant-by-uniform-interface
- https://ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm