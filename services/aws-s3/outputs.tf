output "Bucket" {
  value = aws_s3_bucket.aws_s3.id
  }
output "Região" {
  value = aws_s3_bucket.aws_s3.region
}
output "IAM" {
  value = aws_iam_user.lb.name
}
output "Access_Key" {
    value = aws_iam_access_key.lb.id
}
output "Secret_Key" {
  value = aws_iam_access_key.lb.secret
}