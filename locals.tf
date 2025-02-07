locals {
  scale_mode = "scaled_down"
  # scale_mode = "scaled_up"

  scale_config = {
    scaled_up = {
        deploy_kinesis = true
        deploy_s3 = true
        deploy_sqs = true
        deploy_dynamodb = true
        deploy_rds = true
        deploy_redis = true
    }
    scaled_down = {
        deploy_kinesis = false
        deploy_s3 = false
        deploy_sqs = false
        deploy_dynamodb = false
        deploy_rds = false
        deploy_redis = false
    }
  }
}