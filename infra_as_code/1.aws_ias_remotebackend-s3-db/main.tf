provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "webapp-s3-statefiles" 
}

resource "aws_dynamodb_table" "webapp-terraform-lock" {
  name           = "webapp-terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}