resource "aws_s3_bucket" "local" {

    bucket = "meher-230998"
  
}

terraform {
  backend "s3" {

    bucket = "meherterraform-s3"
    region = "us-east-1"
    key = "Day4/terraform.tfstate"
    encrypt = true

   
  }
}