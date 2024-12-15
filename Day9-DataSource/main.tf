data "aws_s3_bucket" "local" {
    bucket = "demo-cloudfront-swathi"
  
}
output "s3_bucket_arn" {
    value = data.aws_s3_bucket.local
  
}