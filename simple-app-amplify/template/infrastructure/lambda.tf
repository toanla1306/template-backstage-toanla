module "lambda" {
  source = "./modules/lambda"
  name = local.name
  dynamodb_table_arn = module.dynamodb.dynamodb_table_arn
  
}