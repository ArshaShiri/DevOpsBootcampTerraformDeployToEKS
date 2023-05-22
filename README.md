# Deploy to EKS Demo

## VPC
For EKS we need a more specific configuration of VPC compared to the EC2 instances. We are going to use an existing modules for VPCs for EKS. For that we search [here](https://registry.terraform.io/browse/modules). The module that we are going to use can be found [here](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest). The configuration can be found under `vpc.tf`.

## EKS Cluster and Worker Nodes
For this part, we use [this](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest) module. The configuration can be found under `eks-cluster.tf`.

After applying the config and cluster creation, we can set kubectl up:

    aws eks update-kubeconfig --name myapp-eks-cluster --region eu-west-2