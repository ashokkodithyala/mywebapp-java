## Follow the instructions below to set up AWS EKS infrastructure.

 ### Step 1: Make sure to set up a [REMOTE BACKEND](/infra_as_code/1.aws_ias_rb-s3-db/README.md) before you proceed.

 ### Step 2: Update the following variables in the `.tfvars` file based on your environment.
    ````
    # Region
    aws_region = "us-west-1"

    # kubernetes version
    kubernetes_version = 1.29

    # default CIDR range of the VPC
    vpc_cidr = "10.0.0.0/16"

    # This private subnets
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

    # This public subnets
    public_subnets = ["10.0.4.0/24", "10.0.5.0/24"]

    # To set allow inbound traffic from eks
    sg_cidr_blocks_ingress = ["10.0.0.0/8","172.16.0.0/12"]

    # instance types for eks managed node groups
    eks_instance_types = ["t3.medium"]

    # ami type for eks managed node groups
    eks_ami_type = "AL2_x86_64"

    # Specify the enviroment ex: dev, staging, prod
    environment = "dev"
    ````

### Step 2: Run the following commands in your Terraform project folder. Replace the `dev.tfvars` file based on the environment.

  ````
  1. terraform init 
  2. terraform plan -var-file dev.tfvars
  3. terraform apply -var-file dev.tfvars
  ````

