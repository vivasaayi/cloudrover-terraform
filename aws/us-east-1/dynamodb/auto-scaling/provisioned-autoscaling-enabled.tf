resource "aws_dynamodb_table" "provisioned_autoscaling_enabled" {
  count = var.deploy_dynamodb? 1: 0
  
  name           = "provisioned-autoscaling-enabled"

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


resource "aws_appautoscaling_target" "provisioned_table_as_target" {
  count = var.deploy_dynamodb ? 1: 0
  max_capacity       = 5
  min_capacity       = 1
  resource_id        = "table/provisioned-autoscaling-enabled"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "provisioned_dynamodb_table_read_policy" {
  count = var.deploy_dynamodb ? 1: 0
  name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.provisioned_table_as_target[0].resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.provisioned_table_as_target[0].resource_id
  scalable_dimension = aws_appautoscaling_target.provisioned_table_as_target[0].scalable_dimension
  service_namespace  = aws_appautoscaling_target.provisioned_table_as_target[0].service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = 70
  }
}

resource "aws_appautoscaling_target" "provisioned_table_as_target_write" {
  count = var.deploy_dynamodb ? 1: 0
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "table/provisioned-autoscaling-enabled"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "provisioned_dynamodb_table_write_policy" {
  count = var.deploy_dynamodb ? 1: 0
  name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.provisioned_table_as_target_write[0].resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.provisioned_table_as_target_write[0].resource_id
  scalable_dimension = aws_appautoscaling_target.provisioned_table_as_target_write[0].scalable_dimension
  service_namespace  = aws_appautoscaling_target.provisioned_table_as_target_write[0].service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = 70
  }
}