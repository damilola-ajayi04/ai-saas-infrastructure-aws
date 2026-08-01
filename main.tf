module "network" {
  source = "./modules/network"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.network.vpc_id

  admin_cidr = var.admin_cidr

  common_tags = local.common_tags
}

module "compute" {
  source = "./modules/compute"

  project_name = var.project_name
  environment  = var.environment

  common_tags = local.common_tags

  subnet_id = module.network.public_subnet_id

  security_group_id = module.security.security_group_id

  key_name = var.key_name

  instance_type = var.instance_type

  instance_profile_name = module.iam.instance_profile_name
}

module "iam" {

  source = "./modules/iam"

  project_name = var.project_name

  environment = var.environment

  common_tags = local.common_tags
}

module "alb" {

  source = "./modules/alb"

  project_name = var.project_name

  environment = var.environment

  common_tags = local.common_tags

  vpc_id = module.network.vpc_id

  public_subnet_ids = module.network.public_subnet_ids

  security_group_id = module.security.security_group_id

  instance_id = module.compute.instance_id

}