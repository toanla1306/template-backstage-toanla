locals {
  account_id = data.aws_caller_identity.current.account_id
  name = "demo-amplify"
  region = "us-east-1"
  tags = {
    Name = local.name
    Terraform = "true"
  }
}
  
module "amplify" {
  source = "./modules/amplify"
  name = local.name
  repository = "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/amplify-application-demo"
}