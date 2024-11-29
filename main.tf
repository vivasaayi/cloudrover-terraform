module aws_useast_1 {
    source  = "./aws/us-east-1"

    deploy_kinesis = local.scale_config[local.scale_mode].deploy_kinesis
    deploy_sqs = local.scale_config[local.scale_mode].deploy_sqs
    deploy_s3 = local.scale_config[local.scale_mode].deploy_s3
    deploy_dynamodb =  local.scale_config[local.scale_mode].deploy_dynamodb
}