
resource "aws_rds_cluster" "simple_aurora_cluster" {
  count = var.deploy_rds ? 1: 0
  cluster_identifier      = "cloudrover-simple-aurora-cluster"
  engine                  = "aurora-mysql"
  availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "must_be_eight_characters"
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = var.deploy_rds ? 1: 0
  identifier         = "cloudrover-simple-aurora-cluster-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.simple_aurora_cluster[0].id
  instance_class     = "db.t4g.medium"
  engine             = aws_rds_cluster.simple_aurora_cluster[0].engine
  engine_version     = aws_rds_cluster.simple_aurora_cluster[0].engine_version
}