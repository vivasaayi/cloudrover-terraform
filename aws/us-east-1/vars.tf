variable deploy_kinesis {
    type    = bool
    default = false
}

variable deploy_sqs {
    type    = bool
    default = false
}

variable deploy_s3 {
    type    = bool
    default = false
}

variable "deploy_dynamodb" {
  type = bool
  default = false
}