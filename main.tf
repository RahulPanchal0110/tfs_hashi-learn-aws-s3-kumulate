################################################################################
##### Terraform Providers and Backend ##########################################
################################################################################
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws" #### aws provider
      version = "4.51.0"
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
  # backend "remote" {
  #   hostname     = "app.terraform.io"
  #   organization = "sbgtv"
  #   workspaces {
  #     name = "" #### the Terraform workspace
  #   }
  # }
  cloud {
    hostname     = "app.terraform.io" # Optional; defaults to app.terraform.io
    organization = "sbgtv"
    workspaces {
      tags = ["app"]
    }
  }
}

################################################################################
#### AWS Provider Authentication Method ########################################
################################################################################
provider "aws" {
  region = var.aws_region
  ### the IAM role below is for Terraform Cloud Agents Pool role
  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_number}:role/tfc-terraform-agent"
  }
  # default_tags {
  #   tags = {
  #     Terraform       = "true"
  #     Environment     = var.env
  #     Project         = var.project
  #     Business-Unit   = var.business_unit
  #     Account-ID      = data.aws_caller_identity.current.account_id
  #     Account-Name    = data.aws_iam_account_alias.current.account_alias
  #     Asset-Owner     = var.asset_owner     # Consumer of the asset
  #     Asset-Custodian = var.asset_custodian # Implements change, keeps systems running
  #     GitRepo         = var.github_repo
  #     GitOrg          = var.github_org
  #     GitOwner        = var.github_owner
  #     GitTeam         = var.github_team
  #     GitEnv          = var.github_branch
  #   }
  # }
}
################################################################################
############# data AWS current account #########################################
################################################################################
data "aws_caller_identity" "current" {}

output "data_aws_caller_identity_current_account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "data_aws_caller_identity_current_arn" {
  value = data.aws_caller_identity.current.arn
}
output "data_aws_caller_identity_current_user_id" {
  value = data.aws_caller_identity.current.user_id
}
################################################################################
############# data AWS current aws region ######################################
################################################################################
data "aws_region" "current" {}
################################################################################
############# data AWS current aws account alias ###############################
################################################################################
data "aws_iam_account_alias" "current" {}

output "data_aws_iam_account_alias_current_account_alias" {
  value = data.aws_iam_account_alias.current.account_alias
}
################################################################################
############# data AWS canonical user id #######################################
################################################################################
data "aws_canonical_user_id" "current" {}
################################################################################
############# data AWS cloudfront log delivery canonical user id ###############
################################################################################
data "aws_cloudfront_log_delivery_canonical_user_id" "cloudfront" {}
################################################################################
######## Common tags to be assigned to all resources ###########################
################################################################################
locals {
  shortened_account_number           = substr("${data.aws_caller_identity.current.account_id}", -4, -1)
  associated_resource_name           = "${var.project}-${var.aws_account_short_name}-${local.shortened_account_number}-${data.aws_region.current.name}-${var.env}"
  capitalized_aws_account_short_name = upper(var.aws_account_short_name)
  common_tags = {
    Terraform         = "true"
    Environment       = var.env
    Project           = var.project
    Business-Unit     = var.business_unit
    Account-ID        = data.aws_caller_identity.current.account_id
    Account-Name      = data.aws_iam_account_alias.current.account_alias
    Account-ShortName = var.aws_account_short_name
    Asset-Owner       = var.asset_owner     # Consumer of the asset
    Asset-Custodian   = var.asset_custodian # Implements change, keeps systems running
    GitRepo           = var.github_repo
    GitOrg            = var.github_org
    GitOwner          = var.github_owner
    GitTeam           = var.github_team
    GitBranch         = var.github_branch
  }
}
################################################################################
####### Import data from remote state kms ######################################
################################################################################
# data "terraform_remote_state" "kms" {
#   backend = "remote"
#   config = {
#     hostname     = "app.terraform.io"
#     organization = "sbgtv"
#     workspaces = {
#       name = ""
#     }
#   }
# }
################################################################################
################################################################################
################################################################################
