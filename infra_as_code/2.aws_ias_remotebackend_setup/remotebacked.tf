
terraform {
  backend "s3" {
    bucket         = "webapp-s3-statefiles" 
    key            = "webapp/terraform.tfstate"
    region         = "us-west-1"
    encrypt        = true
    dynamodb_table = "webapp-terraform-lock"
  }
}

