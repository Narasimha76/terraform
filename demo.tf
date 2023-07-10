provider "aws" {
    region = "ap-south-1"
    access_key = "AKIAVOZXLTX7PGBGBS4B"
    secret_key = "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"
  
}
variable "cidr-block" {
    description = "cidr range for subnet"
  }

variable "cidr-block-vpc" {
    description = "cidr range for vpc"
  }
resource "aws_vpc" "demo-vpc" {
    cidr_block = var.cidr-block-vpc
    tags = {
      Name= "terraform"
    }
  
}


resource "aws_subnet" "demo-vpc-subnet" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = var.cidr-block
    tags = {
      Name= "terraform-subnet"
    }
  
}

output "vpc" {
    value = aws_vpc.demo-vpc.id
}

output "vpc-subnet" {
    value = aws_subnet.demo-vpc-subnet.id
}