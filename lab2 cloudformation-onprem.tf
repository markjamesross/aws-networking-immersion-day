#Enable only after completing lab1
/*
resource "aws_cloudformation_stack" "on-premise" {
  #Fix typo afterwards else it'll redeploy!
  name = "on-premise-envrionment"

  parameters = {
    SshKeyName = var.key_name
  }

  template_body = data.local_file.cf-onpremise.content
}
output "on-premise" {
  value = aws_cloudformation_stack.on-premise.outputs
}
*/