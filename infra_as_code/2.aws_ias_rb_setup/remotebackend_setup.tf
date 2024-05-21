/*
terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = var.bucket_key
    region         = var.region
    encrypt        = true
    dynamodb_table = var.dynamo_table_name
  }
}
*/