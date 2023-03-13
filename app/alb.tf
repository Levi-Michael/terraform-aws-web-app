module "alb" {
  source  = "terraform-aws-modules/alb/aws"

  name = var.alb_name
  load_balancer_type = "application"

  vpc_id             = data.terraform_remote_state.infra.outputs.vpc_id
  subnets            = data.terraform_remote_state.infra.outputs.public_subnets
  security_groups    = [data.terraform_remote_state.infra.outputs.alb-sg-access-id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 8080
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = "${data.terraform_remote_state.infra.outputs.JenkinsServer-id}"
          port = 8080
        }
      }
    },
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = "${data.terraform_remote_state.infra.outputs.docker-ec2-id}"
          port = 80
        }
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 8080
      protocol           = "HTTP"
      target_group_index = 0
    },
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 1
    }
  ]

  tags = {
    Environment = "dev"
  }
}