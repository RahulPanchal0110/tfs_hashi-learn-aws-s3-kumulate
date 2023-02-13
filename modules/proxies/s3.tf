
################################################################################
######## S3 bucket for Kumulate video proxies ##################################
################################################################################
module "proxies" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.5.0"

  bucket = "proxies-${local.associated_resource_name}"

  acl = "private"

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.s3.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  # logging = {
  #   target_bucket = module.logs_storage.s3_bucket_id
  #   target_prefix = "${local.proxies_bucket_name}-logs/"
  # }

  versioning = {
    status     = true
    mfa_delete = false
  }

  metric_configuration = [
    {
      name = "all"
    }
  ]

  tags = local.common_tags
}
################################################################################
################################################################################
################################################################################
