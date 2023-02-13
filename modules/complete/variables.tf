variable "aws_account_name" {
  type        = string
  description = "aws short account name / profile / station code"
}

variable "project" {
}
variable "project_description" {
}
variable "business_unit" {
  type        = string
  description = "Business Unit"
  default     = "broadcast"
}
################################################################################
######### Git Variables ########################################################
################################################################################
variable "github_repo" {
  default = "tfs_sbgtv-aws-s3-proxies-inews-interplay"
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

############# Vantage Specific Variables 
variable "vantage_server" {
  type        = string
  description = "Vantage Server FQDN"
}
