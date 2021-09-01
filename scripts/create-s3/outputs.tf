output "Bucket" {
  value = module.create-s3.Bucket
  }
output "Região" {
  value = module.create-s3.Região
}
output "IAM" {
  value = module.create-s3.IAM
}
output "Access_Key" {
    value = module.create-s3.Access_Key
}
output "Secret_Key" {
  value = module.create-s3.Secret_Key
}
