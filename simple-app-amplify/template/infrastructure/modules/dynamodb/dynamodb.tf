resource "aws_dynamodb_table" "my_table" {
  name           = var.name
  billing_mode   = "PROVISIONED"  # or "PROVISIONED"
  read_capacity  = var.read_capacity  # Adjust based on your needs if using "PROVISIONED" billing mode
  write_capacity = var.write_capacity  # Adjust based on your needs if using "PROVISIONED" billing mode
  hash_key       = "hash_key_attribute"
  range_key      = "range_key_attribute"
  
  attribute {
    name = "hash_key_attribute"
    type = "S"  # String type, adjust based on your needs
  }

  attribute {
    name = "range_key_attribute"
    type = "N"  # Number type, adjust based on your needs
  }

  # Additional attributes can be defined as needed

  tags = {
    Environment = "Production"
  }
}