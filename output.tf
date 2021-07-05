# Outputs Public ip of webserver1
output "Webserver-Public-IP-1" {
  value = aws_instance.webserver1.public_ip
}

# Outputs Public ip of webserver2
output "Webserver-Public-IP-2" {
  value = aws_instance.webserver2.public_ip
}

# Outputs EC2 Instance state /webserver1
output "instance_state" {
  description = "List of instance states of instances"
  value       = aws_instance.webserver1.instance_state
}

# Outputs EC2 Instance state /webserver2
output "instance_state" {
  description = "List of instance states of instances"
  value       = aws_instance.webserver2.instance_state
}
