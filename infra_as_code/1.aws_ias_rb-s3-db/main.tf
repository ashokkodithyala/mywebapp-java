provider "aws" {
  region = var.region
}

#This is for remote backend state file to store
resource "aws_s3_bucket" "s3_bucket" {
  bucket =var.bucket_name
}

#This is for remote backend lock info to store
resource "aws_dynamodb_table" "terraform_lock" {
  name           = var.dynamo_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

