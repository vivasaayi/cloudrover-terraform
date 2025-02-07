resource "aws_dynamodb_table" "simple_global_table_replica1" {
  count = var.deploy_dynamodb? 1: 0
  
  name           = "SimpleGlobalTable1"

  billing_mode   = "PAY_PER_REQUEST"
  
  hash_key       = "Field1"
  range_key      = "Field2"

#   deletion_protection_enabled = true
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  provider = aws.useast

  server_side_encryption {
    enabled = true
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

resource "aws_dynamodb_table" "simple_global_table_replica2" {
  count = var.deploy_dynamodb? 1: 0
  
  name           = "SimpleGlobalTable1"

  billing_mode   = "PAY_PER_REQUEST"
  
  hash_key       = "Field1"
  range_key      = "Field2"

#   deletion_protection_enabled = true
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  provider = aws.uswest

  server_side_encryption {
    enabled = true
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



resource "aws_dynamodb_global_table" "simple_global_table1" {
  depends_on = [
    aws_dynamodb_table.simple_global_table_replica1,
    aws_dynamodb_table.simple_global_table_replica2,
  ]
  
  provider = aws.useast

  name = "SimpleGlobalTable1"

  replica {
    region_name = "us-east-1"
  }

  replica {
    region_name = "us-west-2"
  }
}

