module "auto_scalong" {
    source = "./auto-scaling"

    deploy_dynamodb = var.deploy_dynamodb
}

module "pitr" {
    source = "./pitr"

    deploy_dynamodb = var.deploy_dynamodb
}

module "deletion_protection" {
    source = "./deletion-protection"

    deploy_dynamodb = var.deploy_dynamodb
}

module "encryption" {
    source = "./encryption"

    deploy_dynamodb = var.deploy_dynamodb
}