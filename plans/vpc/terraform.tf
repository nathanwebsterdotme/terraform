terraform {
  backend "s3" {
    bucket  = "nw-terraform-state-test"
    region  = "eu-west-1"
    key     = "vpc"
    profile = "nath"
  }
}
