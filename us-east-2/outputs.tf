# ################################################################################
# ####### SQS Module Outputs #####################################################
# ################################################################################
# output "module_sqs_delivery_sqs_queue_arn" {
#   description = "The ARN of the SQS queue"
#   value       = module.sqs_delivery.sqs_queue_arn
# }
# output "module_sqs_delivery_sqs_queue_id" {
#   description = "The URL for the created Amazon SQS queue"
#   value       = module.sqs_delivery.sqs_queue_id
# }
# output "module_sqs_delivery_sqs_queue_name" {
#   description = "The name of the SQS queue"
#   value       = module.sqs_delivery.sqs_queue_name
# }
# ################################################################################
# ####### S3 Bucket Outputs ######################################################
# ################################################################################
# output "aws_s3_bucket_delivery_domain_name" {
#   value       = aws_s3_bucket.delivery.bucket_domain_name
#   description = "S3 Logs FQDN of bucket"
# }
# output "aws_s3_bucket_delivery_id" {
#   value       = aws_s3_bucket.delivery.id
#   description = "S3 Logs Bucket Name (aka ID)"
# }
# output "aws_s3_bucket_delivery_arn" {
#   value       = aws_s3_bucket.delivery.arn
#   description = "S3 Logs Bucket ARN"
# }
# output "aws_s3_bucket_delivery_region" {
#   value       = aws_s3_bucket.delivery.region
#   description = "The AWS region this bucket resides in"
# }
# ################################################################################
# ##### outputs for Lambda ## resource "aws_lambda_function" "lambda_function" ###
# ################################################################################
# output "aws_lambda_function_delivery_arn" {
#   value       = aws_lambda_function.delivery.arn
#   description = "Amazon Resource Name ARN identifying your Lambda Function"
# }
# output "aws_lambda_function_delivery_invoke_arn" {
#   value       = aws_lambda_function.delivery.invoke_arn
#   description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
# }
# output "aws_lambda_function_delivery_last_modified" {
#   value       = aws_lambda_function.delivery.last_modified
#   description = "Date this resource was last modified."
# }
# output "aws_lambda_function_delivery_qualified_arn" {
#   value       = aws_lambda_function.delivery.qualified_arn
#   description = "ARN identifying your Lambda Function Version (if versioning is enabled via publish = true)."
# }
# output "aws_lambda_function_delivery_signing_job_arn" {
#   value       = aws_lambda_function.delivery.signing_job_arn
#   description = "ARN of the signing job."
# }
# output "aws_lambda_function_delivery_signing_profile_version_arn" {
#   value       = aws_lambda_function.delivery.signing_profile_version_arn
#   description = "ARN of the signing profile version."
# }
# output "aws_lambda_function_delivery_source_code_size" {
#   value       = aws_lambda_function.delivery.source_code_size
#   description = "Size in bytes of the function .zip file."
# }
# output "aws_lambda_function_delivery_version" {
#   value       = aws_lambda_function.delivery.version
#   description = "Latest published version of your Lambda Function."
# }
# ################################################################################
# ################################################################################
# ################################################################################


