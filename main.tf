module aws_useast_1 {
    source  = "./aws/us-east-1"

    deploy_kinesis = local.scaled_down.deploy_kinesis
    deploy_sqs = local.scaled_down.deploy_sqs
    deploy_s3 = local.scaled_down.deploy_s3
}