# IaC-Using-AWS-Terraform

**Installing Terraform on Windows,**
- Go to www.terraform.io, Downloads. And then choose Windows 64 bit for Windows. You can see a zip file downloaded.
- Go to Downloads, extract the zip file. Now you can see **terraform.exe** file. Copy the file.
- Go to C directory, create new folder ‘Terraform’. Paste it inside.
- Copy the location, C:\Terraform
- Go to system properties -->  env variable --> Click on Path --> Edit --> New --> paste the location **C:\Terraform**. Click ok, ok, ok
- Test that terraform is installed. Go to cmd prompt, and type this command.
  terraform -v

**Installing Terraform on Linux,**
Login to linux machine. 
- Create the directory with the following command: mkdir terraform && cd terraform
- Then, download Terraform using this command: wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
- Install a program called ‘unzip’ in order to unzip the downloaded zip file:
  sudo yum install unzip
- Once installed, unpack the Terraform download: 
  unzip terraform_0.11.14_linux_amd64.zip
- Set the Linux path to point to Terraform with the following command: 
  export PATH=$PATH:$HOME/terraform
- Test that Terraform is installed by typing this command: terraform -v


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

