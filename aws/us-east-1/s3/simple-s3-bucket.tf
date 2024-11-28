resource "aws_s3_bucket" "example" {
  count = var.deploy_s3 ? 1: 0
  bucket = "cloudrover-test-bucket1"
}