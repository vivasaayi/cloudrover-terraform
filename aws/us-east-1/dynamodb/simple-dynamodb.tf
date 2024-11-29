resource "aws_dynamodb_table" "basic-dynamodb-table" {
    count = var.deploy_dynamodb? 1: 0
  name           = "simple-dynamodb"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}

