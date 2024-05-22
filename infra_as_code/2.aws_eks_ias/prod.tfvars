
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
sg_cidr_blocks_ingress = ["10.0.0.0/8","172.16.0.0/12","192.168.0.0/16"]

# instance types for eks managed node groups
eks_instance_types = ["t3.medium"]

# ami type for eks managed node groups
eks_ami_type = "AL2_x86_64"

# Specify the enviroment ex: dev, staging, prod
environment = "prod"

