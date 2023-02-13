################################################################################
####### pull iam policy document for KMS key ###################################
################################################################################
data "aws_iam_policy_document" "s3_kms" {
  statement {
    actions = [
      "kms:*"
    ]
    principals {
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
      type = "AWS"
    }
    resources = [
      "*"
    ]
    sid = "Enable IAM User Permissions"
  }
  statement {
    actions = [
      "kms:GenerateDataKey*"
    ]
    principals {
      identifiers = [
        "s3.amazonaws.com"
      ]
      type = "Service"
    }
    resources = [
      "*"
    ]
    sid = "Allow Amazon S3 use of the key"
  }
}
################################################################################
####### create KMS key for S3 ##################################################
################################################################################
resource "aws_kms_key" "s3" {
  description         = "KMS Key for S3 ${var.project} AWS account ${data.aws_caller_identity.current.account_id} Region ${data.aws_caller_identity.current.account_id}"
  enable_key_rotation = true
  policy              = data.aws_iam_policy_document.s3_kms.json
  tags                = local.common_tags
}
################################################################################
####### create KMS key alias ###################################################
################################################################################
resource "aws_kms_alias" "s3" {
  name          = "alias/s3-${local.associated_resource_name}"
  target_key_id = aws_kms_key.s3.key_id
}
################################################################################
################################################################################
################################################################################
