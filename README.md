# IaC-Using-AWS-Terraform

main.tf - Launches EC2 instances, Elastic load balancer. Created 2 instances. 
output.tf - Declared outputs
var.tf - Declared variables
setup.tf - AWS Provider, sets default AWS region, calculates availability zones, Launches VPC, subnets, route tables, security groups etc.

Command Line Examples: Torun the above project,

To setup provisioner
$ terraform init

To launch the EC2 demo cluster
$ terraform plan 
$ terraform apply 

To teardown the EC2 demo cluster:
$ terraform destroy 

