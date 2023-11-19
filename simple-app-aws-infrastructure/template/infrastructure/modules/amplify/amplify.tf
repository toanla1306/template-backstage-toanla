resource "aws_amplify_app" "my_amplify_app" {
  name     = "MyAmplifyApp"
  repository = var.repository
  iam_service_role_arn = "arn:aws:iam::837472653674:role/service-role/AWSAmplifyCodeCommitExecutionRole-d2vtxncf7owh7q"
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        build:
          commands:
            - echo "build frontend"
      artifacts:
        baseDirectory: application
        files:
          - '**/*'
  EOT
}

resource "aws_amplify_branch" "master" {
  app_id  = aws_amplify_app.my_amplify_app.id
  branch_name = var.branch_name
}

# resource "aws_amplify_domain" "my_domain" {
#   domain_name = "your-amplify-domain"
#   subdomain   = "www"
#   app_id      = aws_amplify_app.my_amplify_app.id
# }

resource "aws_amplify_backend_environment" "my_env" {
  app_id    = aws_amplify_app.my_amplify_app.id
  environment_name = "production"
}
