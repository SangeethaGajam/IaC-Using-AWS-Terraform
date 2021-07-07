#Create webserver
resource "aws_instance" "webserver" {
  count                       = var.instance_count
  ami                         = data.aws_ssm_parameter.webserver-ami.value
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
//  user_data                   = file("webserver_${count.index}.sh")
  user_data = templatefile("webserver_${count.index}.tftpl", {index_file=file("index.html")})
  tags = {
    Name = "webserver${count.index}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

# Create ELB 
resource "aws_elb" "terraform-elb" {
  name = "tf-elb"
  security_groups = [
    aws_security_group.elbsg.id
  ]
  subnets = [
    aws_subnet.subnet.id
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = aws_instance.webserver.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "terraform-elb"
  }
  lifecycle {
    create_before_destroy = true
  }
}
