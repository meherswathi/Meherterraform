
#create Iam user

resource "aws_iam_user" "myuser" {

name = "MeherAvunoori"

}


# Create IAM Role

resource "aws_iam_role" "myrole" {
  name               = "s3fullaccess"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"  # EC2 is allowed to assume this role
        }
      }
    ]
  })
}

# Create the S3 Full Access Policy
resource "aws_iam_policy" "s3fullaccess" {
    name = "s3fullaccesspolicy"
    description = "Provides access to s3 buckets"
    policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
})
  
}


# Attach the S3 Full Access Policy to the IAM Role
resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.myrole.name
  policy_arn = aws_iam_policy.s3fullaccess.arn

}
