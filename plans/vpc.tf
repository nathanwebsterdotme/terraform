
module "vpc" {
  source            = "../modules/vpc"
  vpc_name          = "${var.vpc_name}"
  vpc_cidr_block    = "${var.vpc_cidr_block}"
}


### SUBNETS ###

module "vpc_subnet_public_a" {
  vpc_name          = "${var.vpc_name}"
  source            = "../modules/vpc_subnet"
  availability_zone = "${lookup(var.vpc_subnet_public_a, "az")}"
  cidr_block        = "${lookup(var.vpc_subnet_public_a, "cidr_block")}"
  subnet_name       = "${lookup(var.vpc_subnet_public_a, "subnet_name")}"
  vpc_id            = "${module.vpc.vpc_id_output}"
}

module "vpc_subnet_public_b" {
  vpc_name          = "${var.vpc_name}"
  source            = "../modules/vpc_subnet"
  availability_zone = "${lookup(var.vpc_subnet_public_b, "az")}"
  cidr_block        = "${lookup(var.vpc_subnet_public_b, "cidr_block")}"
  subnet_name       = "${lookup(var.vpc_subnet_public_b, "subnet_name")}"
  vpc_id            = "${module.vpc.vpc_id_output}"
}

module "vpc_subnet_private_a" {
  vpc_name          = "${var.vpc_name}"
  source            = "../modules/vpc_subnet"
  availability_zone = "${lookup(var.vpc_subnet_private_a, "az")}"
  cidr_block        = "${lookup(var.vpc_subnet_private_a, "cidr_block")}"
  subnet_name       = "${lookup(var.vpc_subnet_private_a, "subnet_name")}"
  vpc_id            = "${module.vpc.vpc_id_output}"
}

module "vpc_subnet_private_b" {
  vpc_name          = "${var.vpc_name}"
  source            = "../modules/vpc_subnet"
  availability_zone = "${lookup(var.vpc_subnet_private_b, "az")}"
  cidr_block        = "${lookup(var.vpc_subnet_private_b, "cidr_block")}"
  subnet_name       = "${lookup(var.vpc_subnet_private_b, "subnet_name")}"
  vpc_id            = "${module.vpc.vpc_id_output}"
}


### ROUTE TABLES ###
