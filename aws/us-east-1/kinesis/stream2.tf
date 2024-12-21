resource "aws_kinesis_stream" "test_stream_2" {
  count = var.deploy_kinesis ? 1: 0
  name             = "cloudrover-test-simple-stream2"
  shard_count      = 1
  
  stream_mode_details {
    stream_mode = "PROVISIONED"
  }
}