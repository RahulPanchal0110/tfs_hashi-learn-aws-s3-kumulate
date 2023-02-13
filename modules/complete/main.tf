################################################################################
##### Terraform Providers and Backend ##########################################
################################################################################
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.2.0"
    }
  }
}
################################################################################
############# data AWS current account #########################################
################################################################################
data "aws_caller_identity" "current" {}
################################################################################
############# data AWS current account name alias ##############################
################################################################################
data "aws_iam_account_alias" "current" {}
################################################################################
############# data AWS current aws region ######################################
################################################################################
data "aws_region" "current" {}
################################################################################
######## Common tags to be assigned to all resources ###########################
################################################################################
locals {
  shortened_account_number     = substr("${data.aws_caller_identity.current.account_id}", -4, -1)
  associated_resource_name     = "${var.project}-${var.aws_account_name}-${local.shortened_account_number}-${data.aws_region.current.name}"
  capitalized_aws_account_name = upper(var.aws_account_name)
  common_tags = {
    Terraform          = "true"
    Project            = var.project
    ProjectDescription = var.project_description
    Account-ID         = data.aws_caller_identity.current.account_id
    Business-Unit      = var.business_unit
    Account-Name       = data.aws_iam_account_alias.current.account_alias
    GitRepo            = var.github_repo
    GitOrg             = var.github_org
    GitOwner           = var.github_owner
    GitTeam            = var.github_team
    GitBranch          = var.github_branch
    OnPremServer       = var.onprem_server
  }
}
