module kinesis {
    source = "./kinesis"
    deploy_kinesis = var.deploy_kinesis
}

module sqs {
    source = "./sqs"
    deploy_sqs = var.deploy_sqs
}

module s3 {
    source = "./s3"
    deploy_s3 = var.deploy_s3
}

module dynamodb {
    source = "./dynamodb"
    deploy_dynamodb = var.deploy_dynamodb
}

module rds {
    source = "./rds"
    deploy_rds = var.deploy_rds
}