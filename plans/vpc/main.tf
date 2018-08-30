# Build a standalone VPC

locals {
  common_tags = {
    "terraform_plan" = "vpc"
  }
}

module "vpc" {
  source            = "../../modules/vpc"

  common_tags       = "${local.common_tags}"
  vpc_name          = "${var.vpc_name}"
  vpc_cidr_block    = "${var.vpc_cidr_block}"
}


### SUBNETS ###

module "vpc_subnet_public_a" {
  source            = "../../modules/vpc_subnet"

  common_tags       = "${local.common_tags}"
  vpc_name          = "${var.vpc_name}"
  vpc_id            = "${module.vpc.vpc_id_output}"
  availability_zone = "${lookup(var.vpc_subnet_public_a, "az")}"
  cidr_block        = "${lookup(var.vpc_subnet_public_a, "cidr_block")}"
  subnet_name       = "${lookup(var.vpc_subnet_public_a, "subnet_name")}"

}

module "vpc_subnet_public_b" {
  source            = "../../modules/vpc_subnet"

  common_tags       = "${local.common_tags}"
  vpc_name          = "${var.vpc_name}"
  vpc_id            = "${module.vpc.vpc_id_output}"
  availability_zone = "${lookup(var.vpc_subnet_public_b, "az")}"
  cidr_block        = "${lookup(var.vpc_subnet_public_b, "cidr_block")}"
  subnet_name       = "${lookup(var.vpc_subnet_public_b, "subnet_name")}"
}

module "vpc_subnet_private_a" {
  source            = "../../modules/vpc_subnet"

  common_tags       = "${local.common_tags}"
  vpc_name          = "${var.vpc_name}"
  vpc_id            = "${module.vpc.vpc_id_output}"
  availability_zone = "${lookup(var.vpc_subnet_private_a, "az")}"
  cidr_block        = "${lookup(var.vpc_subnet_private_a, "cidr_block")}"
  subnet_name       = "${lookup(var.vpc_subnet_private_a, "subnet_name")}"
}

module "vpc_subnet_private_b" {
  source            = "../../modules/vpc_subnet"

  common_tags       = "${local.common_tags}"
  vpc_name          = "${var.vpc_name}"
  vpc_id            = "${module.vpc.vpc_id_output}"
  availability_zone = "${lookup(var.vpc_subnet_private_b, "az")}"
  cidr_block        = "${lookup(var.vpc_subnet_private_b, "cidr_block")}"
  subnet_name       = "${lookup(var.vpc_subnet_private_b, "subnet_name")}"
}


### NAT GATEWAYS ###

module "nat_gateway_a" {
  source            = "../../modules/vpc_nat_gateway"

  common_tags       = "${local.common_tags}"
  vpc_name          = "${var.vpc_name}"
  subnet_id         = "${module.vpc_subnet_private_a.subnet_id_output}"
}

module "nat_gateway_b" {
  source            = "../../modules/vpc_nat_gateway"

  common_tags       = "${local.common_tags}"
  vpc_name          = "${var.vpc_name}"
  subnet_id         = "${module.vpc_subnet_private_b.subnet_id_output}"
}


### ROUTE TABLES ###

module "route_table_public" {
  source            = "../../modules/vpc_route_table"

  common_tags       = "${local.common_tags}"
  vpc_name          = "${var.vpc_name}"
  vpc_id            = "${module.vpc.vpc_id_output}"
  route_table_name  = "${var.route_table_public_name}"
}

module "route_table_private_a" {
  source            = "../../modules/vpc_route_table"

  common_tags       = "${local.common_tags}"
  vpc_name          = "${var.vpc_name}"
  vpc_id            = "${module.vpc.vpc_id_output}"
  route_table_name  = "${var.route_table_private_a_name}"
}

module "route_table_private_b" {
  source            = "../../modules/vpc_route_table"

  common_tags       = "${local.common_tags}"
  vpc_name          = "${var.vpc_name}"
  vpc_id            = "${module.vpc.vpc_id_output}"
  route_table_name  = "${var.route_table_private_b_name}"
}


module "route_table_association_public_a" {
  source            = "../../modules/vpc_route_table_association"

  subnet_id         = "${module.vpc_subnet_public_a.subnet_id_output}"
  route_table_id    = "${module.route_table_public.route_table_id}"
}

module "route_table_association_public_b" {
  source            = "../../modules/vpc_route_table_association"

  subnet_id         = "${module.vpc_subnet_public_b.subnet_id_output}"
  route_table_id    = "${module.route_table_public.route_table_id}"
}

module "route_table_association_private_a" {
  source            = "../../modules/vpc_route_table_association"

  subnet_id         = "${module.vpc_subnet_private_a.subnet_id_output}"
  route_table_id    = "${module.route_table_private_a.route_table_id}"
}

module "route_table_association_private_b" {
  source            = "../../modules/vpc_route_table_association"

  subnet_id         = "${module.vpc_subnet_private_b.subnet_id_output}"
  route_table_id    = "${module.route_table_private_b.route_table_id}"
}


### ROUTES ###
