###############################################################################
###### create proxies IAM user account #########################################
###############################################################################
resource "aws_iam_user" "proxies" {
  name = "service-${local.associated_resource_name}"
  path = "/${var.project}/"
  tags = local.common_tags
}
################################################################################
######### Create IAM policy to give necessary ##################################
######### access permissions to S3 bucket   ####################################
################################################################################
resource "aws_iam_policy" "s3" {
  name        = "s3-service-${local.associated_resource_name}"
  path        = "/${var.project}/"
  description = "${var.project} s3 policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
               "s3:ListBucket"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "${module.proxies.s3_bucket_arn}",
                "${module.proxies.s3_bucket_arn}/*",
                "arn:aws:s3:*:*:accesspoint/*",
                "arn:aws:s3:::*/*",
                "arn:aws:s3:*:*:job/*"
            ]
        }
    ]
}
EOF
}
################################################################################
######## attach S3 policy to IAM user ##########################################
################################################################################
resource "aws_iam_user_policy_attachment" "s3_proxies" {
  user       = aws_iam_user.proxies.name
  policy_arn = aws_iam_policy.s3.arn
}
################################################################################
####### KMS IAM Policy #########################################################
################################################################################
resource "aws_iam_policy" "kms" {
  name        = "kms-service-${local.associated_resource_name}"
  path        = "/${var.project}/"
  description = "${var.project} service kms policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:DescribeKey"
            ],
            "Resource": [
              "${aws_kms_key.s3.arn}"
            ]
        }
    ]
}
EOF
}
################################################################################
######## attach KMS policy to IAM user #########################################
################################################################################
resource "aws_iam_user_policy_attachment" "kms_proxies" {
  user       = aws_iam_user.proxies.name
  policy_arn = aws_iam_policy.kms.arn
}
################################################################################
################################################################################
################################################################################
