resource "aws_rds_global_cluster" "simple_global_cluster" {
  global_cluster_identifier = "cloudrover-simple-global-cluster"
  engine                    = "aurora-mysql"
  engine_version            = "8.0.mysql_aurora.3.04.0"
  database_name             = "example_db"
}

resource "aws_rds_cluster" "sg_primary_rds_cluster" {
  provider                  = aws.useast
  engine                    = aws_rds_global_cluster.simple_global_cluster.engine
  engine_version            = aws_rds_global_cluster.simple_global_cluster.engine_version
  cluster_identifier        = "cloudrover-simple-global-cluster-primary-cluster"
  master_username           = "username"
  master_password           = "somepass123"
  database_name             = "example_db"
  global_cluster_identifier = aws_rds_global_cluster.simple_global_cluster.id
  db_subnet_group_name      = "default"
}

resource "aws_rds_cluster_instance" "sgc_primary_insatane" {
  provider             = aws.useast
  engine               = aws_rds_global_cluster.simple_global_cluster.engine
  engine_version       = aws_rds_global_cluster.simple_global_cluster.engine_version
  identifier           = "cloudrover-simple-global-cluster-primary-cluster-instance"
  cluster_identifier   = aws_rds_cluster.sg_primary_rds_cluster.id
  instance_class       = "db.r7g.large"
  db_subnet_group_name = "default"
}

resource "aws_rds_cluster" "sg_secondary_rds_cluster" {
  provider                  = aws.uswest
  engine                    = aws_rds_global_cluster.simple_global_cluster.engine
  engine_version            = aws_rds_global_cluster.simple_global_cluster.engine_version
  cluster_identifier        = "cloudrover-simple-global-cluster-secondary-cluster"
  global_cluster_identifier = aws_rds_global_cluster.simple_global_cluster.id
  db_subnet_group_name      = "default-vpc-c1d5ebb9"

  depends_on = [
    aws_rds_cluster_instance.sgc_primary_insatane
  ]
}

resource "aws_rds_cluster_instance" "secondary" {
  provider             = aws.uswest
  engine               = aws_rds_global_cluster.simple_global_cluster.engine
  engine_version       = aws_rds_global_cluster.simple_global_cluster.engine_version
  identifier           = "cloudrover-simple-global-cluster-secondary-cluster-instance"
  cluster_identifier   = aws_rds_cluster.sg_secondary_rds_cluster.id
  instance_class       = "db.r7g.large"
  db_subnet_group_name = "default-vpc-c1d5ebb9"
}