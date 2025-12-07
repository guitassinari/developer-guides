# JSON API

A REST API compliant specification that allows the client to query only the resources it needs. It also allows querying for related resources on a single request.

It is defined by the [JSON API specification](https://jsonapi.org/) and uses the `application/vnd.api+json` MIME type (though `application/json` is also accepted).

Example:

Request to articles including the author (only name) and the title and body of the article.
```
GET /articles?include=author&fields[articles]=title,body&fields[people]=name
```

Response:
```json
{
    "data": [
        {
            "type": "articles",
            "id": "1",
            "attributes": {
                "title": "JSON API paints my bikeshed!"
            },
            "relationships": {
                "author": {
                    "data": { "id": "42", "type": "people" }
                }
            }
        }
    ],
    "included": [
        {
            "type": "people",
            "id": "42",
            "attributes": {
                "name": "John"
            }
        }
    ]
}
```

## JSON API vs GraphQL

GraphQL is an open-source that allows the client to query only the resources it needs in a single request and a single endpoont (usually `/graphql`). JSON API, on the other hand, allows the same while also being REST compliant by using the HTTP methods and response codes, and a resource-based URL structure.

See discussion: https://www.reddit.com/r/graphql/comments/12u6crb/graphql_vs_jsonapi/