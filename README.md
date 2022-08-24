# :chart_with_downwards_trend: AWS Lambda zipper

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

## Infrastructure

You can create test AWS infrastructure with the following commands:

```sh
cd infrastructure/aws
terraform init
terraform apply
```
