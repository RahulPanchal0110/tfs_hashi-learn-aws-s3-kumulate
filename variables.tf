# ################################################################################
# ######## AWS Authentication ####################################################
# ################################################################################
# variable "aws_account_number" {
#   description = "AWS account number needed for TFE IAM role"
# }
################################################################################
######## AWS Region ############################################################
################################################################################
variable "aws_region" {
  description = "AWS region to launch servers."
}
# ################################################################################
# ######## Project Variables #####################################################
# ################################################################################
# ###  <account name or station sign> - <aws account number> - <region> - <environment>
# variable "aws_account_short_name" {
#   description = "AWS account short name, profile or SBGTV Station Call Sign: all lowercase, no spaces"
#   # default     = "sandbox"
# }
variable "business_unit" {
  type        = string
  description = "Business Unit"
  default     = "broadcast"
}
variable "env" {
  description = "The environment. Values corresponding to the branch name"
  default = "prod"
}
## dev, stage, prod, qa (stands for sandbox or qa branch)

variable "project" {
  default = "kumulate"
}
variable "asset_owner" {
  type        = string
  description = "Consumer of the asset"
  default     = "ml-corp-sonyci@sbgtv.com"
}
variable "asset_custodian" {
  type        = string
  description = "Implements change, keeps systems running"
  default     = "ml-corp-sonyci@sbgtv.com"
}
################################################################################
######### Git Variables ########################################################
################################################################################
variable "github_repo" {
  default = "tfs_sbgtv-aws-s3-kumulate"
}
variable "github_org" {
}
variable "github_owner" {
}
variable "github_team" {
}
variable "github_branch" {
  type        = string
  description = "GitHub Branch corresponding to Terraform Cloud Workspace"
}
################################################################################
################################################################################
################################################################################
