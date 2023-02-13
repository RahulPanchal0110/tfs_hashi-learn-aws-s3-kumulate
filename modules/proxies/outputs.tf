################################################################################
####### S3 Bucket Outputs ##### module "proxies" ################################
################################################################################
output "module_proxies_s3_bucket_bucket_domain_name" {
  value       = module.proxies.s3_bucket_bucket_domain_name
  description = "S3 FQDN of bucket"
}
output "module_proxies_s3_bucket_id" {
  value       = module.proxies.s3_bucket_id
  description = "S3 Bucket Name (aka ID)"
}
output "module_proxies_s3_bucket_arn" {
  value       = module.proxies.s3_bucket_arn
  description = "S3 Bucket ARN"
}
output "module_proxies_s3_bucket_region" {
  value       = module.proxies.s3_bucket_region
  description = "The AWS region this bucket resides in"
}
################################################################################
################################################################################
################################################################################
