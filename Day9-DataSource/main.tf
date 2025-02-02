#data "aws_s3_bucket" "local" {
#    bucket = "demo-cloudfront-swathi"  
#}
#output "s3_bucket_arn" {
#    value = data.aws_s3_bucket.local  
#}


data "aws_ami" "test" {
  filter {
    name   = "name"
    values = ["al2023-ami-2023.6.20250128.0-kernel-6.1-x86_64"]
  }
}
resource "aws_instance" "Local" {

    ami= data.aws_ami.test.id
    instance_type = "t2.micro"
    key_name = "Developer2"
  
}