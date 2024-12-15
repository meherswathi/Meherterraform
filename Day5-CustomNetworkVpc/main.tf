resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/24"
    tags = {
      name= "Dev-VPC"
    }
}
resource "aws_subnet" "dev" {
  vpc_id = aws_vpc.dev.id
  cidr_block = "10.0.0.0/24"
  tags = {
    name = "Dev-Subnet"
  }
}
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      name= "DevIGW"
    } 
}
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id
    }
  
}
resource "aws_route_table_association" "dev" {
  subnet_id = aws_subnet.dev.id
  route_table_id = aws_route_table.dev.id
}

terraform {
  backend "s3" {

    bucket = "meherterraform-s3"
    region = "us-east-1"
    key = "Day5CNW/terraform.tfstate"
    encrypt = true

   
  }
}
