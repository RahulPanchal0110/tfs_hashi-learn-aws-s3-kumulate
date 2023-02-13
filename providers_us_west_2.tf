################################################################################
#### AWS Providers #############################################################
################################################################################

###### US-WEST-2 ###############################################################
provider "aws" {
  alias  = "kabb"
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::810303933202:role/tfc-terraform-agent"
  }
}

provider "aws" {
  alias  = "katu"
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::611828441027:role/tfc-terraform-agent"
  }
}

provider "aws" {
  alias  = "kbak"
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::502484618368:role/tfc-terraform-agent"
  }
}

provider "aws" {
  alias  = "keye"
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::075871076523:role/tfc-terraform-agent"
  }
}

provider "aws" {
  alias  = "kfox"
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::359212834718:role/tfc-terraform-agent"
  }
}

provider "aws" {
  alias  = "kmph"
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::783437323890:role/tfc-terraform-agent"
  }
}

provider "aws" {
  alias  = "komo"
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::822617382271:role/tfc-terraform-agent"
  }
}

provider "aws" {
  alias  = "ksnv"
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::480309101663:role/tfc-terraform-agent"
  }
}

provider "aws" {
  alias  = "kutv"
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::954872679524:role/tfc-terraform-agent"
  }
}
################################################################################
################################################################################
################################################################################
