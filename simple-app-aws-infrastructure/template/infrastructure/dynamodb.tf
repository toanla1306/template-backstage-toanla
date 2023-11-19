module "dynamodb" {
  source = "./modules/dynamodb"
  name = local.name
  read_capacity = 5
  write_capacity = 5
}