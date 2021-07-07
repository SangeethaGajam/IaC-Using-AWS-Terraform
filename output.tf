# Outputs Public ip of webserver0
output "Webserver-Public-IP-1" {
  value = aws_instance.webserver.0.public_ip
}

# Outputs Public ip of webserver1
output "Webserver-Public-IP-2" {
  value = aws_instance.webserver.1.public_ip
}


# Outputs EC2 Instance state /webserver0
output "instance_state1" {
  description = "List of instance states of instances"
  value       = aws_instance.webserver.0.instance_state
}

# Outputs EC2 Instance state /webserver1
output "instance_state2" {
  description = "List of instance states of instances"
  value       = aws_instance.webserver.1.instance_state
}

# Outputs Load Balancer DNS Name
output "load_balancer_dns" {
  description = "Load Balancer DNS Name"
  value       = aws_elb.terraform-elb.dns_name
}
