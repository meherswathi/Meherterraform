resource "aws_instance" "Local" {

    ami= "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
    key_name = "Developer2"
  
}
