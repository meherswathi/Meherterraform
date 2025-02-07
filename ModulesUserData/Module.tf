module "UserData" {
    source = "../UserData"
}
terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "meherterraform-s3"
    key = "Userdata/terraform.tfstate"
    encrypt = true
    
  }
}