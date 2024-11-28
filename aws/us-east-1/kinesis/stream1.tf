resource "aws_kinesis_stream" "test_stream" {
  name             = "simple-stream"
  shard_count      = 1
  
  stream_mode_details {
    stream_mode = "PROVISIONED"
  }
}