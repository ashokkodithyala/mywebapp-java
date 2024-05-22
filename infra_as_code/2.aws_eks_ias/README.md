## Follow the instructions below to provision the AWS EKS infrastructure.

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

### Terraform will provision the following infrastructure after the successful completion of Step 2.
````
- VPC creation:
    - Creation of public subnets, internet gateway, and route tables for public subnets.
- Security Groups:
    -Security groups to control traffic to and from the EKS cluster.
- IAM Roles:
    - Creation of IAM roles and attach policies for EKS cluster and worker nodes to manage permissions securely.
- EKS Cluster:
    - Use Terraform AWS EKS module to provision the EKS cluster.
    - Configure subnets, VPC, cluster version, and node groups.
- Outputs:
    - It outputs cluster name, endpoint, and security group IDs.
````
````
### Infrastructure Provisioning:
- VPC Network: Creates a virtual private cloud (VPC) with public subnets, an internet gateway, and route tables for the subnets, enabling communication with the internet.
- Security Groups: Defines security groups to control incoming and outgoing traffic to and from the EKS cluster, ensuring proper access.
- IAM Roles and Policies: Creates IAM roles and attaches appropriate policies for the EKS cluster and worker nodes. This ensures secure access and permission management.

### EKS Cluster with Terraform:
- Provisioning with Terraform: Leverages the Terraform AWS EKS module to automate the provisioning of the EKS cluster.
- Cluster Configuration: Configures essential parameters like subnets, VPC, desired Kubernetes version, and node groups for the cluster.

Outputs:
Cluster Details: Provides outputs including the cluster name, endpoint URL, and security group IDs for easy reference.
````