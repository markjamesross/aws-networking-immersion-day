#Region variable to deploy code into and also used to build up AZ info for AZ specific resources (e.g. subnets)
variable "region" {
  default = "us-east-1"
}
#Variable for EC2 instance key pair.  Default value is the one the AWS Event engine generates, if you're doing this yourself you need to create one
variable "key_name" {
  default = "ee-default-keypair"
}
#Variable to send emails for notifications to
variable "email_address" {}
