provider "aws" {
    region = "ap-south-1"
    access_key = "AKIAVOZXLTX7PGBGBS4B"
    secret_key = "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"
  
}

resource "aws_vpc" "demo-vpc" {
    cidr_block = var.cidr-block-vpc
    tags = {
      Name= "terraform"
    }
  
}

module "module-subnet" {
  source = "./modules/subnets"
  cidr-block = var.cidr-block
  vpc_id = aws_vpc.demo-vpc.id
  default_route_table_id = aws_vpc.demo-vpc.default_route_table_id  

}

resource "aws_security_group" "demo-sg" {
  name = "demo-sg"
  vpc_id = aws_vpc.demo-vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["192.168.1.55/32"]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   
}

