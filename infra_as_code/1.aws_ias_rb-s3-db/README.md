## Terraform State file store

- Remote backend is for store the state files in S3 and lock information in Dynamo db

## Follow below the instructions to setup Remote backend 

### Step 1: Updated below variables in dev.tfvars file
  ```
  region = "us-east-1"
  bucket_name = "ashok-s3-poc-remotebackendstore" 
  dynamo_table_name = "ashok-terraform-lock"
  bucket_key = "ashokpoc/terraform.tfstate"
  ```
### Step 2: Run following command to create a AWS S3 Bucket and Dynamo DB table
  ````
  1. terraform init 
  2. terraform plan -var-file dev.tfvars
  3. terraform apply -var-file dev.tfvars
  ````
### Step 3:
  ````
  Log into AWS Console and verify S3 Bucket and Dynamo db 
  ````

### Step 4:
- Copy following code in remotebackend_setup.tf and save in terraform project folder 
- Update below info
````
terraform {
  backend "s3" {
    bucket         = <Bucket name from step 3>
    key            = <Bucket Key>
    region         = <Region>
    encrypt        = true
    dynamodb_table = <Dynamo table name from step 3>
  }
}
````

