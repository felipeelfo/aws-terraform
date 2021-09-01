output "Bucket" {
  value = aws_s3_bucket.b.id
}
output "Região" {
  value = aws_s3_bucket.b.region
}
output "IAM" {
  value = aws_iam_user.lb.name
}
output "Access_Key" {
    value = aws_iam_access_key.lb.idy
}
output "Secret_Key" {
  value = aws_iam_access_key.lb.secret
}
