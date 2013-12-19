## CRUD REST interface for Couchbase in Rails ##
This is a simple REST interface for doing CRUD ops with Couchbase (get,set,add,replace,incr,decr). I need to add a few more, but it has a solid set of features. It can also do CAS with storage ops.

**Note: there isn't any authentication of any sort in this for consumers (although that's not hard at all to add)**

It's recommended to not expose Couchbase or any database to the public directly, keep everything behind firewalls and VPC's, etc. 
I only use this thing on my home computers locally. You have been warned! :)

#### Chrome Postman Template ####
(https://www.getpostman.com/collections/f62f69bc1d023d3de8c7)
Create an environment that has host and port values for the rails app after it's running

Couchbase Server Settings are in /config/yettings.yml

### Operations ###

|  VERB  | URL                        | DESC                                                              |
|:------:|----------------------------|-------------------------------------------------------------------|
|   GET  | /:key                      | GET document with key from "default" bucket                       |
|   GET  | /:bucket/:key              | GET key from specified bucket                                     |
|   PUT  | /:bucket/s/:key            | SET creates or updates a document with key, post data is raw JSON |
|   PUT  | /:bucket/r/:key            | REPLACE document with key, post data is raw JSON                  |
|  POST  | /:bucket/a/:key            | ADD operation for document, post data is raw JSON                 |
|   PUT  | /incr/:key                 | INCR key by 1 default bucket                                      |
|   PUT  | /incr/:key/:amount         | INCR key by amount, default bucket                                |
|   PUT  | /incr/:key/:amount/create  | INCR key by amount, or create if needed, default bucket           |
|   PUT  | /:bucket/incr/:key         | INCR key by 1, specify bucket                                     |
|   PUT  | /:bucket/incr/:key/:amount | INCR key by amount, specify bucket                                |
|   PUT  | /:bucket/incr/:key/:amount | INCR key by amount, specify bucket, create if needed              |
|   PUT  | /decr/:key                 | same ops as incr, but decr in url                                 |
| DELETE | /:key                      | DELETES document, default bucket                                  |
| DELETE | /:bucket/:key              | DELETES document from specified bucket                            |
|   GET  | /ddocs                     | retrieve Design Documents for default bucket                      |
|   GET  | /ddocs/all                 | retrieve Design Documents for all buckets                         |
|   GET  | /:bucket/ddocs             | retrieve Design Documents for specified bucket                    |

### PUT/POST data for set/add/replace takes this format: ###

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

### TODO ###

* Add Observe possibilities for Storage Operations (tricky with REST)
* Add append/prepend operations
* Add View Querying Route


