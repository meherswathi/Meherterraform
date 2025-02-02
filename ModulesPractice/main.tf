resource "aws_instance" "local" {
    ami = var.ami
    instance_type = var.type
    key_name = var.key_name

}