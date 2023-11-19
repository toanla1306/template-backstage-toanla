module "codepipeline" {
  source = "./modules/codepipeline"
  name = local.name
  S3BucketName = "test123"
  S3ObjectKey  = "path/test123"
  ProjectName = module.codebuild.ProjectName
}