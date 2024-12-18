resource "aws_rds_cluster" "good_cluster" {
  count = var.deploy_rds ? 1: 0
  cluster_identifier      = "cloudrover-good-aurora-cluster"
  engine                  = "aurora-mysql"
  availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name           = "mydb"
  master_username         = "foofooo"
  master_password         = "must_be_eight_characters"
  storage_encrypted       = true
  kms_key_id              = "arn:aws:kms:us-east-1:526470662813:key/49321415-dcfd-4e26-9f84-485c3405b1f1"
}

resource "aws_rds_cluster_instance" "good_cluster_instances" {
  count              = var.deploy_rds ? 1: 0
  identifier         = "cloudrover-good-aurora-cluster-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.good_cluster[0].id
  instance_class     = "db.t4g.medium"
  engine             = aws_rds_cluster.good_cluster[0].engine
  engine_version     = aws_rds_cluster.good_cluster[0].engine_version
  # kms_key_id         = "arn:aws:kms:us-east-1:526470662813:key/49321415-dcfd-4e26-9f84-485c3405b1f1"
}