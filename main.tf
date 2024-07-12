provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Owner         = "Vlad"
      "Create by"   = "Terraform"
      Project       = "Demo"
    }
  }
}

module "vpc_dev" {
  source = "git@github.com:filareth/terraform-modules.git//aws_network"
  env = "development"
  vpc_cidr = "10.100.0.0/16"
  public_subnet_cidrs = ["10.100.1.0/24"]
  private_subnet_cidrs = []
}

module "vpc_prod" {
  source = "git@github.com:filareth/terraform-modules.git//aws_network"
  env = "production"
  vpc_cidr = "10.40.0.0/16"  
  public_subnet_cidrs = ["10.40.1.0/24", "10.40.2.0/24", "10.40.3.0/24"]
  private_subnet_cidrs = ["10.40.11.0/24", "10.40.22.0/24", "10.40.33.0/24"]
}

module "vpc_test" {
  source = "git@github.com:filareth/terraform-modules.git//aws_network"
  env = "test"
  vpc_cidr = "10.10.0.0/16"
  public_subnet_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnet_cidrs = ["10.10.11.0/24", "10.10.22.0/24"]
}

output "dev_public_subnet_ids" {
  value = module.vpc_dev.public_subnet_ids
}

output "dev_private_subnet_ids" {
  value = module.vpc_dev.private_subnet_ids
}

output "prod_public_subnet_ids" {
  value = module.vpc_prod.public_subnet_ids
}

output "prod_private_subnet_ids" {
  value = module.vpc_prod.private_subnet_ids
}

output "test_public_subnet_ids" {
  value = module.vpc_test.public_subnet_ids
}

output "test_private_subnet_ids" {
  value = module.vpc_test.private_subnet_ids
}
