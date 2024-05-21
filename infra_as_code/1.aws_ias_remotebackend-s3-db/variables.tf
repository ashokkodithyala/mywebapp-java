variable "region" {
  description = "This is to region"
}

variable "bucket_name" {
  description = "This is to assign s3 bucket name"
}

variable "dynamo_table_name" {
  description = "This is to assign dynamo table name"
}

variable "bucket_key" {
  description = "This is to assign bucket key"
}



# for testing only
variable "ami" {
  description = "This is AMI for the instance"  
}

variable "instance_type" {
  description = "This is the instance type, for example: t2.micro"
  default = "t2.micro"  
}
