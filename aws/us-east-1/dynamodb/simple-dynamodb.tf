resource "aws_dynamodb_table" "basic-dynamodb-table" {
    count = var.deploy_dynamodb? 1: 0
  name           = "simple-dynamodb"
  
  billing_mode   = "PAY_PER_REQUEST"

  hash_key       = "Field1"
  range_key      = "Field2"

  attribute {
    name = "Field1"
    type = "S"
  }

  attribute {
    name = "Field2"
    type = "S"
  }
}

