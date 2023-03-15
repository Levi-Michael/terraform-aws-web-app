
TOPIC

    A Terraform project split for two state's that deploy Jenkins and Docker AWS environment.

SHORT DESCRIPTION

    The environment include:
    
    VPC with multiple subnets public and private, internet gateway, security groups
    and 2 EC2 instance pre installed Jenkins server and Docker engine with load blancer and ECR.
	
HOW TO RUN
	
    Clone this Git and run:
    1. terraform init
    2. terraform init -upgrade
    3. terraform plan
    4. terraform apply
