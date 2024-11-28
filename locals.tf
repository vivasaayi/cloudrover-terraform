locals {
  scaled_up = {
    deploy_kinesis = true
    deploy_s3 = true
    deploy_sqs = true
  }
   scaled_down = {
    deploy_kinesis = false
    deploy_s3 = true
    deploy_sqs = false
  }

}