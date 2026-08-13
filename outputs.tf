output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "instance_id" {
  value = module.compute.instance_id
}

output "public_ip" {
  value = module.compute.public_ip
}

output "public_dns" {
  value = module.compute.public_dns
}

output "alb_dns_name" {

  value = module.alb.alb_dns_name

}

output "application_log_group" {
  value = module.logging.application_log_group_name
}

output "nginx_log_group" {
  value = module.logging.nginx_log_group_name
}

output "system_log_group" {
  value = module.logging.system_log_group_name
}