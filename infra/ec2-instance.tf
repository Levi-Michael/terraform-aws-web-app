module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = {
    docker-ec2 = file("docker-deploy.sh")
    JenkinsServer = file("jenkins_deploy.sh")

  }

  name = "instance-${each.key}"

  ami                    = var.ami_id
  instance_type          = var.instance_type
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.application-sg-access.id]
  subnet_id              = module.vpc.private_subnets[0]
  iam_instance_profile = aws_iam_instance_profile.project-ec2-SSM-profile.name

  user_data = "${each.value}"

  tags = {
    name = "instance-${each.key}"
    Terraform   = "true"
    Environment = "dev"
  }
}