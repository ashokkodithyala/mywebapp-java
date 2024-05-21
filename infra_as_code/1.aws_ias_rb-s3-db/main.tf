provider "aws" {
  region = var.region
}


resource "aws_s3_bucket" "s3_bucket" {
  bucket =var.bucket_name
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = var.dynamo_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# for testing only
resource "aws_instance" "webserver_dev" {
  instance_type = var.instance_type
  ami = var.ami
  subnet_id = "subnet-0458702752bd2939f"  
}

