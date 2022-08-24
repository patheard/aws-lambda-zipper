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

The Terraform apply will fail on the first apply since the the Docker image
required to create the Lambda function won't exist yet.  You can build and
push the Docker image like so:

```sh
# Build the Docker image
make docker

AWS_ACCOUNT_ID="your AWS account ID"
AWS_REGION="shockingly, your AWS region"
AWS_ECR_REPO="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"

# Login to the ECR and push the toasty fresh Docker image
aws ecr get-login-password --region "$AWS_REGION" | docker login --username AWS --password-stdin "$AWS_ECR_REPO"
docker tag aws-lambda-zipper:latest "$AWS_ECR_REPO/aws-lambda-zipper:latest"
docker push "$AWS_ECR_REPO/aws-lambda-zipper:latest"

# Rerun the apply to create the Lambda function
cd infrastructure/aws
terraform apply
```
