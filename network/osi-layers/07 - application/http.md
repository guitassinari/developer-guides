# HTTP: HyperText Transfer Protocol

## Headers

### Content-Type

A representation header that indicates the media type (or MIME type) of the resource being sent/received beofre it's encoded. If encoded, the Content-Encoding heather is used to indicate the encoding method. If the server receiving the request has restrictions on the types of resource it can process, it returns a 415 HTTP error.

Format:

```
Content-Type: <media-type>
```

#### Media types (MIME types)

Media type (or Multipurpose Internet Mail Extensions type) is a way to identify the type of data being sent/received.

Format:

```
<type>/<subtype>; <optional parameters{charset, boundary for multipart}>
```

Examples:

```
text/plain; charset=utf-8
application/json; charset=utf-8
application/x-www-form-urlencoded; charset=utf-8
multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW
```


#### References

- https://datatracker.ietf.org/doc/html/rfc6838