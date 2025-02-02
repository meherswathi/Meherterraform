resource "aws_vpc" "Dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name = "DevVpc"
    } 
}
#SubNet
resource "aws_subnet" "Subnet" {
    vpc_id = aws_vpc.Dev.id
    cidr_block = "10.0.0.0/24"
    tags = {
      name = "DevSubnet"
    }
}
#IGW
resource "aws_internet_gateway" "DevIGW"{
    vpc_id = aws_vpc.Dev.id
    tags = {
      name = "DevIGW"
    }
}

#Route Table

resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.Dev.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.DevIGW.id
    }
  
}
resource "aws_route_table_association" "dev" {
  subnet_id = aws_subnet.Subnet.id
  route_table_id = aws_route_table.dev.id
}

terraform {
  backend "s3" {

    bucket = "meherterraform-s3"
    region = "us-east-1"
    key = "VpcCreation/terraform.tfstate"
    encrypt = true
    
  }
}