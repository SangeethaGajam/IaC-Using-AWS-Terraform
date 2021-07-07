# IaC-Using-AWS-Terraform

Find the steps here to install Terraform on different machines.
https://learn.hashicorp.com/tutorials/terraform/install-cli

**Installing Terraform on Windows,**
- Go to www.terraform.io, Downloads. And then choose Windows 64 bit for Windows. You can see a zip file downloaded.
- Go to Downloads, extract the zip file. Now you can see **terraform.exe** file. Copy the file.
- Go to C directory, create new folder ‘Terraform’. Paste it inside.
- Copy the location, C:\Terraform
- Go to system properties -->  env variable --> Click on Path --> Edit --> New --> paste the location **C:\Terraform**. Click ok, ok, ok
- Test that terraform is installed. Go to cmd prompt, and type this command.
  terraform -v

**Set up the environment to work with AWS, Terraform on Windows machine.**
Login to AWS free tier account/AWS management console.
- Select your region. I have choosen 'us-east-1'.
- Go to your profile name, select **My security credentials** --> Access Keys --> Create new Access Key. Copy the Access/ Secret keys.
- Go to key pairs --> Create key pair --> Give it a name. Choose file format pem and click Create key pair.

- Login to Visual studio code. Go to Extensions, Search for Terraform. Install Terraform by HashiCorp.
- Create a working directory folder in your machine. Open the folder in Visual Studio code.

Ensure you copy **.terraform** file to the working directory folder.
provider.tf : Details of AWS provider
main.tf : Launches 2 EC2 instances, Elastic load balancer. 
output.tf : Declare outputs
variables.tf : Declare variables
nsg.tf : Security groups
setup.tf : Calculates availability zones, Launches VPC, subnets, route tables etc.

**Command Lines: To run the above project, use the below commands**

$ terraform init : To initialize
$ terraform plan : Creates an execution plan
$ terraform apply : Executes the actions proposed in a Terraform plan

**Note : $ terraform destroy : To delete all the resources

Once you execute the above project. You can see the 2 ec2 instances on AWS management console, EC2 instances.
Creates load balancer on those both EC2 instances.
Here is the public ips for 2 ec2 instances.
You can see the output by hitting the below links.
Instance1
http://3.91.97.119:80
or
ec2-3-91-97-119.compute-1.amazonaws.com:80

Instance2
http://107.23.17.234/
or
https://ec2-107-23-17-234.compute-1.amazonaws.com/
