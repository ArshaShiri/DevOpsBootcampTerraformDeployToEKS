provider "aws" {
    region = "eu-west-2"
}

variable vpc_cidr_block {}
variable private_subnet_cidr_blocks {}
variable public_subnet_cidr_blocks {}

# Query the AZs in the region defined in the provider
data "aws_availability_zones" "available" {}

module "myapp-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"

  # Insert required variables here
  name = "myapp-vpc"
  cidr = var.vpc_cidr_block

  # Best practice is to create 1 private and 1 public subnet in each AZ.
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets = var.public_subnet_cidr_blocks
  azs = data.aws_availability_zones.available.names

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true

  tags = {
      "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
  }

  public_subnet_tags = {
      "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
      "kubernetes.io/role/elb" = 1 
  }

  private_subnet_tags = {
      "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
      "kubernetes.io/role/internal-elb" = 1 
  }
}
