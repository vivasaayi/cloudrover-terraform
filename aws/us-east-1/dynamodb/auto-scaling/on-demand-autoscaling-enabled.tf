resource "aws_dynamodb_table" "autoscaling_enabled" {
  count = var.deploy_dynamodb? 1: 0
  
  name           = "ondemand-autoscaling-enabled"

  billing_mode   = "PAY_PER_REQUEST"
  
  hash_key       = "Field1"
  range_key      = "Field2"

  attribute {
    name = "Field1"
    type = "S"
  }

  on_demand_throughput {
     max_read_request_units = 2
     max_write_request_units = 2
  }

  attribute {
    name = "Field2"
    type = "S"
  }
}


# resource "aws_appautoscaling_target" "ondemand_table_as_target_read" {
#   max_capacity       = 5
#   min_capacity       = 1
#   resource_id        = "table/ondemand-autoscaling-enabled"
#   scalable_dimension = "dynamodb:table:ReadCapacityUnits"
#   service_namespace  = "dynamodb"
# }

# resource "aws_appautoscaling_policy" "ondemand_dynamodb_table_read_policy" {
#   name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.ondemand_table_as_target_read.resource_id}"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.ondemand_table_as_target_read.resource_id
#   scalable_dimension = aws_appautoscaling_target.ondemand_table_as_target_read.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.ondemand_table_as_target_read.service_namespace

#   target_tracking_scaling_policy_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "DynamoDBReadCapacityUtilization"
#     }

#     target_value = 70
#   }
# # }

# resource "aws_appautoscaling_target" "ondemand_table_as_target_write" {
#   max_capacity       = 4
#   min_capacity       = 1
#   resource_id        = "table/ondemandmake -autoscaling-enabled"
#   scalable_dimension = "dynamodb:table:WriteCapacityUnits"
#   service_namespace  = "dynamodb"
# }

# resource "aws_appautoscaling_policy" "ondemand_dynamodb_table_write_policy" {
#   name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.ondemand_table_as_target_write.resource_id}"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.ondemand_table_as_target_write.resource_id
#   scalable_dimension = aws_appautoscaling_target.ondemand_table_as_target_write.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.ondemand_table_as_target_write.service_namespace

#   target_tracking_scaling_policy_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "DynamoDBWriteCapacityUtilization"
#     }

#     target_value = 70
#   }
# }
