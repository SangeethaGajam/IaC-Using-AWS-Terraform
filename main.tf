#Create webserver using Docker container
resource "aws_instance" "webserver1" {
  ami                         = data.aws_ssm_parameter.webserver-ami.value
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  provisioner "remote-exec" {
    inline = [
    "set -ex",
    "sudo yum update -y",
    "sudo amazon-linux-extras install docker -y",
    "sudo service docker start",
    "sudo systemctl enable docker",
    "sudo usermod -a -G docker ec2-user",
    "sudo curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
    "sudo chmod +x /usr/local/bin/docker-compose",
    "sudo docker run --name webserver --detach --publish 80:80 httpd:latest"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("main-key.pem")
      host        = self.public_ip
    }
  }
  tags = {
    Name = "webserver1"
  }
}

#Create webserver and serves a static HTML file
resource "aws_instance" "webserver2" {
  ami                         = data.aws_ssm_parameter.webserver-ami.value
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install httpd && sudo systemctl start httpd",
      "echo '<h1><center>Hello World!</center></h1>' > index.html",
      "sudo mv index.html /var/www/html/"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("main-key.pem")
      host        = self.public_ip
    }
  }
  tags = {
    Name = "webserver2"
  }
}




# Create ELB 
resource "aws_elb" "terraform-elb" {
  name = "terraform-elb"
    security_groups = [
      aws_security_group.elbsg.id
    ]
      subnets = [
      aws_subnet.subnet.id
    ]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  instances = [aws_instance.webserver1.id, aws_instance.webserver2.id]
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags = {
  Name = "terraform-elb"
  }
}


