################################################################################
###### US-EAST-2 ###############################################################
################################################################################
module "kfdm" {
  source              = "../modules/proxies"
  aws_account_name    = "kfdm"
  project             = var.project
  project_description = var.project_description
  github_repo         = var.github_repo
  github_org          = var.github_org
  github_owner        = var.github_owner
  github_team         = var.github_team
  github_branch       = var.github_branch
  archive_bucket      = "primary.library.news.kfdm.stations" ### existing s3 bucket for archives
  onprem_server       = "kfdm-mtn1.sbgnet.int"
  providers = {
    aws = aws.kfdm
  }
}