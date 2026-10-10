data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "app.terraform.io/gowthami_s_git/test/aws"
  version = "1.1.0  "

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  tags = {
    Name = var.vpc_name
  }
}
