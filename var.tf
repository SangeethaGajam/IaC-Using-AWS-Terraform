variable "instance_count" {
  type        = number
  description = "No of EC2 instance to be created"
}

variable "instance_type" {
  description = "Type of EC2 Instance"
}

variable "key_name" {
  description = "key name for the instance"
}

//Provider
variable "access_key" {
  description = "AWS Access key"
}

variable "secret_key" {
  description = "AWS Secret Key"
}

variable "region" {
  description = "AWS Region"
}

//NSG
variable "nsg_rule" {
  type        = list(list(string))
  description = "Security Group Description and Port"
}
