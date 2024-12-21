resource "aws_sqs_queue" "terraform_queue_2" {
  count = var.deploy_sqs? 1: 0
  name                      = "cloudrover-test-simple-queue-2"
}