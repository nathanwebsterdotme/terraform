variable "vpc_name" {
  description = "The name of your VPC to build"
}

variable "vpc_cidr_block" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
}

variable "vpc_enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  default     = true
}
