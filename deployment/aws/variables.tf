variable "ami" {
  description = "The AMI to use for the instance"
  default     = ""
}

variable "instance_type" {
  description = "The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance"
  default     = ""
}

variable "availability_zone" {
  description = "The AZ to start the instance in"
  default     = ""
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with"
  type = list
  default = []
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  default     = ""
}

variable "key_name" {
  description = "The key name of the Key Pair to use for the instance"
  default     = ""
}