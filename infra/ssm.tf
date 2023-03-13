# SSM configurations
resource "aws_iam_role" "project_AmazonSSMManagedInstanceCore_role" {
  name = "Terraform_AmazonSSMManagedInstanceCore_role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "SSM-policy-attach" {
  role       = aws_iam_role.project_AmazonSSMManagedInstanceCore_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "project-ec2-SSM-profile" {
  name = "project-ec2-SSM-profile"
  role = aws_iam_role.project_AmazonSSMManagedInstanceCore_role.name
}