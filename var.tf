variable "instance_count" {
  type = number
  default = "2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "key name for the instance"
  default = "main-key"
}

