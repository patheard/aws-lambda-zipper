# AWS Lambda zipper

Lambda function that accepts a list of S3 object keys, creates a zip archive with those objects and uploads the archive back to the S3 bucket.

```javascript
// Lambda event
{
  "s3ObjectKeys": [
    "some/object/key.png",
    "another/object/key.png",
    "root-key.txt"
  ]
}
```
