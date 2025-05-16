# VPC Module
module "vpc2" {
  source            = "./modules/VPC"
  cidr_block_range  = var.cidr_block_range
  cidr_subnet_range = var.cidr_subnet_range
}

# Security Group Module
module "sg" {
  source  = "./modules/SG"
  vpc2_id = module.vpc2.vpc2_id
}

# EC2 Module 
module "ec2" {
  source    = "./modules/EC2"
  sg_id     = module.sg.sg_id
  subnets   = module.vpc2.subnet_ids
  ec2_names = var.ec2_names
}

# ALB module
module "alb" {
  source       = "./modules/ALB"
  sg_id        = module.sg.sg_id
  subnet_ids   = module.vpc2.subnet_ids
  vpc2_id      = module.vpc2.vpc2_id
  instance_ids = module.ec2.instance_ids

}


