# Deployment of IAM and S3 Resources for Telestream Kumulate

### Git Branches corresponding to Terraform Cloud workspaces

| git branch | TFC workspace                       |
| ---------- | ----------------------------------- |
| us-east-1  | tfs_sbgtv-aws-s3-kumulate-us-east-1 |
| us-east-2  | tfs_sbgtv-aws-s3-kumulate-us-east-2 |
| us-west-2  | tfs_sbgtv-aws-s3-kumulate-us-west-2 |

Use module `proxies` to generate an S3 bucket for video proxies, an IAM user to access the bucket and KMS key.