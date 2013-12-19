# Rails based REST interface for Couchbase #
This is a simple REST interface for doing CRUD ops with Couchbase (get,set,add,replace,incr,decr). I need to add a few more, but it has a solid set of features. It can also do CAS with storage ops.

** Note there is not authentication of any sort in this (although that's not hard at all to add)

#### Chrome Postman Operations ####
(https://www.getpostman.com/collections/537d27083fe84c20505d)
Create an environment that has host and port values for the rails app after it's running

Couchbase Server Settings are in /config/yettings.yml

| VERB | URL             | DESC                                                          |
|:----:|-----------------|---------------------------------------------------------------|
|  GET | /:key           | retrieves document with key from "default" bucket             |
|  GET | /:bucket/:key   | retrieves key from specified bucket                           |
|  PUT | /:bucket/s/:key | creates or updates a document with key, post data is raw JSON |
|  PUT | /:bucket/r/:key | replaces document, post data is raw JSON                      |

POST data for set/add/replace takes this format:

```javascript
// Simple Value
{
  "post": {
    "value": 1,
    "options": {} 
  }
}

// JSON Document as Value
{
  "post": {
    "value": {
      "name": "Heimerdinger",
      "hero_type": "Mage"
    },
    "options": {} 
  }
}

// Want Expiration/TTL? add to options
{
  "post": {
    "value": "my string",
    "options": {
      "ttl": 30
    } 
  }
}

// Optimistic concurrency with CAS add to options, if provided it uses it
{
  "post": {
    "value": "my string",
    "options": {
      "ttl": 30,
      "cas": 17480574146356051968
    } 
  }
}
```
