#Criando Bucket S3
resource "aws_s3_bucket" "aws_s3" {
    bucket = var.bucket_name
    acl = "private"    
}
#Criando User IAM
resource "aws_iam_user" "lb" {
  name = "s3-${var.bucket_name}"
  path = "/system/"
}
#Criando Access Key
resource "aws_iam_access_key" "lb" {
  user    = aws_iam_user.lb.name  
}
#Criando Policy de Acesso ao Bucket
resource "aws_iam_user_policy" "lb_ro" {
  name = "policy-s3-${var.bucket_name}"
  user = aws_iam_user.lb.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
     {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
      "${aws_s3_bucket.aws_s3.arn}",
      "${aws_s3_bucket.aws_s3.arn}/*"
      ]
    }
  ]
}
EOF
}

