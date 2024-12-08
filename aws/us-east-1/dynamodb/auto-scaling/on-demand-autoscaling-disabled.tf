resource "aws_dynamodb_table" "autoscaling_disabled" {
  count = var.deploy_dynamodb? 1: 0
  
  name           = "ondemand-autoscaling-disabled"

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

