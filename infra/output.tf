output "ssm_iam_instance_profile" {
  value = aws_iam_instance_profile.project-ec2-SSM-profile.name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "application-sg-access-id" {
  value = aws_security_group.application-sg-access.id
}
output "alb-sg-access-id" {
  value = aws_security_group.alb-sg-access.id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
output "public_subnets" {
  value = module.vpc.public_subnets
}

output "JenkinsServer-id" {
  value = module.ec2_instance["JenkinsServer"].id
}

output "docker-ec2-id" {
  value = module.ec2_instance["docker-ec2"].id
}