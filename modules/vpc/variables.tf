# VPC Variable Names

variable common_tags               {}
variable vpc_name                  {}
variable vpc_cidr_block            {}

variable "vpc_enable_dns_support" {
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  default     = true
}
