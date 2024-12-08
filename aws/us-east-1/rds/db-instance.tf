resource "aws_db_instance" "default" {
  count = var.deploy_rds ? 1: 0
  allocated_storage    = 10
  db_name              = "cloudrovertest"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "adminadmin"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}