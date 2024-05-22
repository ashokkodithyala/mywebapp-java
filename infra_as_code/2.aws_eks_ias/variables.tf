variable "aws_region" {
  default = "us-west-1"
  description = "aws region"
}

variable "kubernetes_version" {
  default     = 1.27
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}

variable "private_subnets" {
  description = "This private subnets"
  type        = set(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "This public subnets"
  type        = set(string)
  default     =  ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "sg_cidr_blocks_ingress" {
  description = "To set allow inbound traffic from eks"
  type        = set(string)
  default     =  ["10.0.0.0/8","172.16.0.0/12","192.168.0.0/16"]
}

variable "eks_instance_types" {
  description = "instance types for eks managed node groups"
  type        = set(string)
  default     = ["t3.medium"]
}    

variable "eks_ami_type" {
  description = "ami type for eks managed node groups"  
  default     = "AL2_x86_64"
}  

variable "environment" {
  default = "dev"
  description = "Specify the enviroment ex: dev, staging, prod"
}