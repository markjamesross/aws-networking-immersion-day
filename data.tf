#Find latest Amazon Linux 2 AMI
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

#Object to use CloudFormation YAML file within Terraform
data "local_file" "cf-onpremise" {
  filename = "${path.module}/src/lab2 on-premise-simulator.yml"
}
#find AWS Account ID
data "aws_caller_identity" "current" {}