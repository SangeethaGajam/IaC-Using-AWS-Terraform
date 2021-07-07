access_key     = "##########"
secret_key     = "##########"
region         = "us-east-1"
instance_count = 2
instance_type  = "t2.micro"
key_name       = "main-key"
nsg_rule = [
  ["Allow traffic from TCP/22", 22, "0.0.0.0/0"],
  ["Allow traffic from TCP/80", 80, "0.0.0.0/0"],
  ["Allow traffic from TCP/8080", 8080, "0.0.0.0/0"],
  ["Allow SSH traffic from CIDR", 22, "60.242.0.0/32"],
]
