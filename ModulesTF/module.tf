module "demo" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
    key_name = "Developer2"
  
}