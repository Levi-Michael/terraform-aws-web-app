variable "vpc_name" {
  description = "vpc_name"
  type        = string
  default     = "module-project-vpc"
}

variable "vpc-cidr" {
  description = "vpc-cidr - 10.0.0.0/16"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "azs"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "private_subnets" {
  description = "private_subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "public_subnets" {
  description = "public_subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "ami_id" {
  description = "ami_id"
  type        = string
  default     = "ami-0d1ddd83282187d18"
}

variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = "t2.micro"
}