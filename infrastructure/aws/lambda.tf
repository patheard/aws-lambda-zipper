module "aws_lambda_zipper" {
  source = "github.com/cds-snc/terraform-modules?ref=v3.0.13//lambda"

  name                   = "aws-lambda-zipper"  
  ecr_arn                = aws_ecr_repository.aws_lambda_zipper.arn  
  image_uri              = "${aws_ecr_repository.aws_lambda_zipper.repository_url}:latest"
  memory                 = 1024
  timeout                = 300
  enable_lambda_insights = true
  billing_tag_value      = var.billing_code

  environment_variables = {
    BUCKET_NAME = module.bucket.s3_bucket_id
  }

  policies = [
    data.aws_iam_policy_document.aws_lambda_zipper.json,
  ]
}

data "aws_iam_policy_document" "aws_lambda_zipper" {
  statement {
    sid    = "AllowZipperReadWriteBucket"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions",
      "s3:GetBucketLocation",
      "s3:Get*",
      "s3:Put*"
    ]
    resources = [
      module.bucket.s3_bucket_arn,
      "${module.bucket.s3_bucket_arn}/*"
    ]
  }
}