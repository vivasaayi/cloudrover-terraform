resource "aws_dynamodb_table" "deletion_protection_disabled" {
  count = var.deploy_dynamodb? 1: 0
  
  name           = "deletion-protection-disabled"

  billing_mode   = "PAY_PER_REQUEST"
  
  hash_key       = "Field1"
  range_key      = "Field2"

  point_in_time_recovery {
    enabled = false
  }

  attribute {
    name = "Field1"
    type = "S"
  }

  attribute {
    name = "Field2"
    type = "S"
  }
}
