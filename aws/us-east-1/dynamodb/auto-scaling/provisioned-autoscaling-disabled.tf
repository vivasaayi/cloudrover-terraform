resource "aws_dynamodb_table" "provisioned_autoscaling_disabled" {
  count = var.deploy_dynamodb? 1: 0
  
  name           = "provisioned-autoscaling-disabled"

  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  
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

