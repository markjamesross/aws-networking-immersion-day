#Enable after VPN section
/*
#Create Route53 Resolver in VPCA
resource "aws_route53_resolver_endpoint" "on-premise" {
  name      = "ImmersionDay-Out"
  direction = "OUTBOUND"

  security_group_ids = [
    aws_vpc.a.default_security_group_id
  ]

  ip_address {
    subnet_id = aws_subnet.vpca-a.id
  }

  ip_address {
    subnet_id = aws_subnet.vpca-b.id
  }
}
#Create Route53 Resovler Rule
resource "aws_route53_resolver_rule" "on-premise" {
  name                 = "NetworkImmersionDay-rule"
  domain_name          = "example.corp"
  rule_type            = "FORWARD"
  resolver_endpoint_id = aws_route53_resolver_endpoint.on-premise.id
  target_ip {
    ip = aws_cloudformation_stack.on-premise.outputs.DnsServerPrivateIp
  }
}
#Associate with VPCs
resource "aws_route53_resolver_rule_association" "vpc-a" {
  resolver_rule_id = aws_route53_resolver_rule.on-premise.id
  vpc_id           = aws_vpc.a.id
}
resource "aws_route53_resolver_rule_association" "vpc-b" {
  resolver_rule_id = aws_route53_resolver_rule.on-premise.id
  vpc_id           = aws_vpc.b.id
}
resource "aws_route53_resolver_rule_association" "vpc-c" {
  resolver_rule_id = aws_route53_resolver_rule.on-premise.id
  vpc_id           = aws_vpc.c.id
}
*/