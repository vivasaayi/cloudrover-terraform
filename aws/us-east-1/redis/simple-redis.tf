resource "aws_elasticache_cluster" "example" {
    count = var.deploy_redis ? 1 : 0
    cluster_id           = "cloudrover-simple-redis"
    engine               = "redis"
    node_type            = "cache.m4.large"
    num_cache_nodes      = 1
    parameter_group_name = "default.redis7"
    engine_version       = "7.1"
    port                 = 6379
}