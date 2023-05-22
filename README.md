# Deploy to EKS Demo

## VPC
For EKS we need a more specific configuration of VPC compared to the EC2 instances. We are going to use an existing modules for VPCs for EKS. For that we search [here](https://registry.terraform.io/browse/modules). The module that we are going to use can be found [here](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest). The results can be seen in `vpc.tf` file.


