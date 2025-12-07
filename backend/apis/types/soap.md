# SOAP (Simple Object Access Protocol)

SOAP is a protocol for exchanging data in a structured format between applications using XML as the message format, mostly for extensibility.

It is language/technology agnostic and can be used with any programming language.

It is built around functions/operations (instead of resources like in REST). For example, where in REST you'd have a `/users` endpoint, in SOAP you'd have a `GetUsers` operation.

SOAP calls are non-cacheable, mostly because it uses POST HTTP requests, which are not idempotent (meaning multiple calls can have in different results) and because the URI for a SOAP API points to the SOAP server, not a specific resource (the operation is inside the body sent to the server).

SOAP can work upon multiple protocols, like HTTP, SMTP, UDP...

An example SOAP API URI and method

```
POST http://webservices.daehosting.com/services/isbnservice.wso
```

An example of a SOAP request:

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
 <soap:Body>
  <IsValidISBN10 xmlns="http://webservices.daehosting.com/ISBN">
   <sISBN>0-19-852663-6</sISBN>
  </IsValidISBN10>
 </soap:Body>
</soap:Envelope>
```

And response:

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <m:IsValidISBN10Response xmlns:m="http://webservices.daehosting.com/ISBN">
         <m:IsValidISBN10Result>true</m:IsValidISBN10Result>
      </m:IsValidISBN10Response>
   </soap:Body>
</soap:Envelope>
```

## Security

WS-Security with SSL support.

## Resources

- https://blog.postman.com/soap-api-definition/
- https://www.w3.org/TR/soap12-part1/