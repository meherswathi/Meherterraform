resource "aws_instance" "name" {

    ami = "ami-0453ec754f44f9a4a"
    instance_type = "t2.medium"
    key_name = "Developer2"

#    lifecycle {
#      ignore_changes = [ 
#        instance_type
#       ]
#    }
    
# lifecycle {
#      prevent_destroy = true
# }


# lifecycle {
# create_before_destroy = true
#}
  
}

terraform {
  backend "s3" {
    bucket = "meherterraform-s3"
    region = "us-east-1"
    key = "Day7-LifeCycle/Terraform.tfstate"
    encrypt = true

  }
}
