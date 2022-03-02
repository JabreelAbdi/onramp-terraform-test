module "first_vpc_module" {
  source = "github.com/JabreelAbdi/onramp-terraform-lab/modules/vpc"

  vpc_cidr            = "192.168.0.0/16"
  public_subnet_name  = "public_1"
  private_subnet_name = "private_1"
  public_subnet_cidr  = "192.168.0.0/18"
  private_subnet_cidr = "192.168.64.0/18"
  name_of_vpc         = "test module vpc"
  tags                = "development"
}

module "first_ec2_module" {
  source = "github.com/JabreelAbdi/onramp-terraform-lab/modules/ec2"

  ami            = "ami-0bf84c42e04519c85"
  instance_type  = "t2.micro"
  key_name       = "ta-lab-ansible-key"
  tags           = "first ec2 module"
  icmp_whitelist = ["79.67.176.243/32", "86.25.101.121/32"]
  vpc_id         = module.first_vpc_module.vpc_id
  subnet_id      = module.first_vpc_module.public_subnet
}

# module "second_vpc_module" {
#   source = "github.com/JabreelAbdi/onramp-terraform-lab.git"

#   vpc_cidr            = "172.31.0.0/16"
#   public_subnet_name  = "public_2"
#   private_subnet_name = "private_2"
#   public_subnet_cidr  = "172.31.0.0/17"
#   private_subnet_cidr = "172.31.128.0/17"
#   name_of_vpc         = "test 2 module vpc"
#   tags                = "production"
# }

# module "second_ec2_module" {
#   source = "github.com/JabreelAbdi/onramp-terraform-lab.git"

#   ami            = "ami-0bf84c42e04519c85"
#   instance_type  = "t2.micro"
#   key_name       = "ta-lab-ansible-key"
#   tags           = "second ec2 module"
#   icmp_whitelist = ["79.67.176.243/32", "86.25.101.121/32"]
#   vpc_id         = module.second_vpc_module.vpc_id
#   subnet_id      = module.second_vpc_module.public_subnet
# }
