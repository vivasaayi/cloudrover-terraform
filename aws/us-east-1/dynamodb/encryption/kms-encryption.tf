resource "aws_dynamodb_table" "kms_encryption_key" {
  count = var.deploy_dynamodb? 1: 0
  
  name           = "customer-kms-encryption-enabled"

  billing_mode   = "PAY_PER_REQUEST"
  
  hash_key       = "Field1"
  range_key      = "Field2"

  deletion_protection_enabled = true

  server_side_encryption {
    enabled = true
    kms_key_arn = "arn:aws:kms:us-east-1:526470662813:key/d14bf519-574b-4564-8e45-84e06a9b5340"
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

