#Enable after completing Lab 3
/*
#Network ACLs
resource "aws_network_acl" "a" {
  vpc_id     = aws_vpc.a.id
  subnet_ids = [aws_subnet.tgw-vpca-a.id, aws_subnet.tgw-vpca-b.id]
  tags = {
    Name = "netw-tgw-nacl-vpca"
  }
}
resource "aws_network_acl_rule" "a-in" {
  network_acl_id = aws_network_acl.a.id
  rule_number    = 100
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}
resource "aws_network_acl_rule" "a-out" {
  network_acl_id = aws_network_acl.a.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}
resource "aws_network_acl" "b" {
  vpc_id     = aws_vpc.b.id
  subnet_ids = [aws_subnet.tgw-vpcb-a.id, aws_subnet.tgw-vpcb-b.id]
  tags = {
    Name = "netw-tgw-nacl-vpcb"
  }
}
resource "aws_network_acl_rule" "b-in" {
  network_acl_id = aws_network_acl.b.id
  rule_number    = 100
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}
resource "aws_network_acl_rule" "b-out" {
  network_acl_id = aws_network_acl.b.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}
resource "aws_network_acl" "c" {
  vpc_id     = aws_vpc.c.id
  subnet_ids = [aws_subnet.tgw-vpcc-a.id, aws_subnet.tgw-vpcc-b.id]
  tags = {
    Name = "netw-tgw-nacl-vpcc"
  }
}
resource "aws_network_acl_rule" "c-in" {
  network_acl_id = aws_network_acl.c.id
  rule_number    = 100
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}
resource "aws_network_acl_rule" "c-out" {
  network_acl_id = aws_network_acl.c.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}
#Modify default NACL in VPC B
resource "aws_default_network_acl" "a" {
  default_network_acl_id = aws_vpc.a.default_network_acl_id
  #Choose which ingress rules are required based on which part of the labs you're doing
  ingress {
    protocol   = "icmp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.1.0.0/16"
    icmp_type = "-1"
    icmp_code = "-1"
    from_port  = 0
    to_port    = 0
  }
  
  #ingress {
  #  protocol   = -1
  #  rule_no    = 100
  #  action     = "allow"
  #  cidr_block = "0.0.0.0/0"
  #  from_port  = 0
  #  to_port    = 0
  #}
  
  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}
*/