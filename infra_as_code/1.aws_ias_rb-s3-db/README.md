### Remote backend setup
- Remote backend is for store the state files in S3 and lock information in Dynamo db
- Step 1: Updated below variables in dev.tfvars file
  ```
  region = "us-east-1"
  bucket_name = "ashok-s3-poc-remotebackendstore" 
  dynamo_table_name = "ashok-terraform-lock"
  bucket_key = "ashokpoc/terraform.tfstate"
  ```
