#Criando Bucket S3
resource "aws_s3_bucket" "b" {
    bucket = var.name_bucket
    acl = private
    region = us-east-1 
}
#Criando User IAM
resource "aws_iam_user" "lb" {
  name = "s3-${var.name_bucket}"
  path = "/system/"
}
#Criando Access Key
resource "aws_iam_access_key" "lb" {
  user    = aws_iam_user.lb.name  
}
#Criando Policy de Acesso ao Bucket
resource "aws_iam_user_policy" "lb_ro" {
  name = "policy-s3-${var.name_bucket}"
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
      "${aws_s3_bucket.b.arn}",
      "${aws_s3_bucket.b.arn}/*"
      ]
    }
  ]
}
EOF
}

