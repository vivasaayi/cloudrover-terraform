terraform {
  backend "s3" {
    bucket = "cloudrover-terraform-resources" 
    key    = "cloudrover-terraform"
    region = "us-east-1"
  }
}