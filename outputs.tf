output "vpc_id" {
  value = module.first_vpc_module.vpc_id
}

output "public_subnet" {
  value = module.first_vpc_module.public_subnet
}

output "public_ip" {
    value = module.first_ec2_module.public_ip
}

# output "vpc_id_2" {
#   value = module.second_vpc_module.vpc_id
# }

# output "public_subnet_2" {
#   value = module.second_vpc_module.public_subnet
# }



# output "public_ip2" {
#     value = module.second_ec2_module.public_ip
# }