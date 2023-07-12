resource "aws_subnet" "demo-vpc-subnet" {
    vpc_id = var.vpc_id
    cidr_block = var.cidr-block
    tags = {
      Name= "terraform-subnet"
    }
}

resource "aws_internet_gateway" "demo-internet-gateway" {
    vpc_id = var.vpc_id
    tags = {
      Name: "dem0-igw"
    }
}


resource "aws_default_route_table" "demo-default-rt" {
    default_route_table_id = var.default_route_table_id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.demo-internet-gateway.id
    }
    tags = {
      Name: "demo-main-rg"
    }
  
}