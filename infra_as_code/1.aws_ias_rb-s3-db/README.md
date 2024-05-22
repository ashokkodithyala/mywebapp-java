## Terraform State file - Remote Backend Setup

#### Terraform Remote Backends
In Terraform, a backend defines where it stores its state data. By default, Terraform uses a local backend, which keeps the state files on your local machine. This can be limiting, especially when collaborating with others.

Remote backends offer a solution: they store the state data in a remote storage service like Amazon S3, Azure Blob Storage, Google Cloud Storage, or even Terraform Cloud itself. This allows multiple users to access and modify the infrastructure state in a centralized location

## Follow the instructions below to set up a remote backend

#### Step 1: [Install AWS CLI and Terraform](infra_as_code/README.md)  ***(assuming it hasn't been completed yet)***

#### Step 2: Update below variables in dev.tfvars file
  ```
  1. region = "us-east-1"
  2. bucket_name = "ashok-s3-poc-remotebackendstore" 
  3. dynamo_table_name = "ashok-terraform-lock"
  4. bucket_key = "ashokpoc/terraform.tfstate"
  ```
#### Step 3: Run following command to create a AWS S3 Bucket and Dynamo DB table in AWS
  ````
  1. terraform init 
  2. terraform plan -var-file dev.tfvars
  3. terraform apply -var-file dev.tfvars
  ````
#### Step 4: Verify
  ````
  Log into AWS Console and verify S3 Bucket and Dynamo db 
  ````

#### Step 5: Create a file `remotebackend_setup.tf` in terraform project folder and update variables from Step 1
````
terraform {
  backend "s3" {
    bucket         = <Bucket name>
    key            = <Key>
    region         = <Region>
    encrypt        = true
    dynamodb_table = <Dynamo table name>
  }
}
````

