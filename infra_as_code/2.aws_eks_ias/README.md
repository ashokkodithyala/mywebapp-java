## Follow the instructions below to provision the AWS EKS infrastructure.

#### Step 1: Make sure to set up a [REMOTE BACKEND](/infra_as_code/1.aws_ias_rb-s3-db/README.md) before you proceed.

#### Step 2: Update the following variable values in the `.tfvars` file according to the environment. A sample is provided for the DEVELOPMENT environment 
    
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
    

#### Step 3: Run the following commands from Terraform project folder. Replace the `dev.tfvars` file based on the environment.

  ````
  1. terraform init 
  2. terraform plan -var-file <<dev.tfvars>>
  3. terraform apply -var-file <<dev.tfvars>>
  ````
  

### Terraform will provision the following infrastructure after the successful completion of Step 2.
#### Infrastructure Provisioning:
- **VPC Network**: Creates a virtual private cloud (VPC) with private and public subnets, an internet gateway, and route tables for the subnets, enabling communication with the internet.
- **Security Groups**: Defines security groups to control incoming and outgoing traffic to and from the EKS cluster, ensuring proper access.
- **IAM Roles and Policies**: Creates IAM roles and attaches appropriate policies for the EKS cluster and worker nodes. This ensures secure access and permission management.

#### EKS Cluster with Terraform:
- **Provisioning with Terraform**: Leverages the Terraform AWS EKS module to automate the provisioning of the EKS cluster.
- **Cluster Configuration**: Configures essential parameters like subnets, VPC, desired Kubernetes version, and node groups for the cluster.

### Outputs:
- **Cluster Details**: Provides outputs including the cluster name, endpoint URL, and security group IDs for easy reference.


#### Terraform Configuration Breakdown:
- **providers.tf**: Defines the AWS provider and the region where your infrastructure will be deployed.
- **vpc.tf**: Creates the core network infrastructure, including the Virtual Private Cloud (VPC), public subnets, internet gateway, and route tables.
- **security-groups.tf**: Establishes security groups that control network traffic flow to and from your EKS cluster for enhanced security.
- **eks-cluster.tf**: Utilizes the Terraform AWS EKS module to automate the provisioning of your EKS cluster.
- **iam-policy.json**: This file refers to an IAM policy document used in AWS and attaches appropriate policies for the EKS cluster and worker nodes, ensuring secure access.
- **variables.tf**: This file defines the variables that will use in Terraform configuration.
- **dev.tfvars**: This is a variable value file for DEVELOPMENT enviroment. This file provides the actual values for the variables defined and used during execution.
- **staging.tfvars**: This is a variable value file for STAGING enviroment. This file provides the actual values for the variables defined and used during execution.
- **prod.tfvars**: This is a variable value file for PRODUCTION enviroment. This file provides the actual values for the variables defined and used during execution.
- **outputs.tf**: Defines outputs for essential information like the cluster name, endpoint URL, and security group IDs, making them readily accessible.

