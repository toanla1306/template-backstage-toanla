module "gateway" {
  source = "./modules/gateway"
  name = local.name
  lambda_invoke_arn = module.lambda.lambda_function_invoke_arn
  my_lambda_function_arn = aws_lambda_function.my_lambda_function.arn
  
}