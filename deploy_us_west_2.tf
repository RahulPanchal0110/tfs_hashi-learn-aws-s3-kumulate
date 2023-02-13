################################################################################
###### US-WEST-2 ###############################################################
################################################################################
module "kabb" {
  source              = "./modules/complete"
  aws_account_name    = "kabb"
  project             = var.project
  project_description = var.project_description
  github_repo         = var.github_repo
  github_org          = var.github_org
  github_owner        = var.github_owner
  github_team         = var.github_team
  github_branch       = var.github_branch
  onprem_server      = "kbak-mtn1.sbgnet.int"
  providers = {
    aws = aws.kabb
  }
}