#Create SG for allowing TCP/80,TCP/8080 & TCP/22
resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TCP/80 & TCP/22"
  vpc_id      = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.nsg_rule
    content {
      description = ingress.value[0]
      from_port   = ingress.value[1]
      to_port     = ingress.value[1]
      protocol    = "tcp"
      cidr_blocks = [ingress.value[2]]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Create SG for elastic load balancer
resource "aws_security_group" "elbsg" {
  name = "security_group_for_elb"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
