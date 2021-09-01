provider "aws" {
  region  = "us-east-1"
}

module "create-s3" {
  source = "../../services/aws-s3"
  bucket_name = "${var.bucket_name}"  
}