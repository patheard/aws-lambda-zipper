module "bucket" {
  source = "github.com/cds-snc/terraform-modules?ref=v3.0.13//S3"
   
  bucket_name       = "aws-lambda-zipper-bucket-${random_pet.bucket.id}"
  billing_tag_value = "scratch-account"

  versioning = {
    enabled = true
  }
}

resource "random_pet" "bucket" {
  length = 2
}
