module "vpc" {
  source         = "github.com/bjreddy009037/tf-module-vpc"
  VPC_CIDR_BLOCK = var.VPC_CIDR_BLOCK
  COMPONENT      = var.COMPONENT
  ENV            = var.ENV
  AZ             = var.AZ
  SUBNET_CIDR    = var.SUBNET_CIDR
}

module "rabbitmq" {
  source     = "github.com/bjreddy009037/tf-module-rabbitmq"
  COMPONENT  = var.COMPONENT
  ENV        = var.ENV
  NODE       = var.NODE_TYPE
  VPC_ID     = module.vpc.VPC_ID
  VPC_CIDR   = module.vpc.VPC_CIDR
  SUBNET_IDS = module.vpc.SUBNET_IDS

}

