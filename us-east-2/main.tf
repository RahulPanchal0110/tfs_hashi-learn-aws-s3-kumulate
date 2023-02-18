################################################################################
##### Terraform Providers and Backend ##########################################
################################################################################
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws" #### aws provider
      version = "4.54.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
  }
  cloud {
   #hostname     = "app.terraform.io" # Optional; defaults to app.terraform.io
    organization = "hashicorp-learn-phase-1"
    workspaces {
      tags = ["kumulate"]
    }
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
