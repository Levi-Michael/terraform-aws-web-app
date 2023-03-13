resource "aws_ecr_repository" "TerraformECR"{
  name                 = "terraformecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}