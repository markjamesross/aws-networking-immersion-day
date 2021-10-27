#Create VPC
resource "aws_vpc" "b" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "VPC B"
  }
}
#Create subnet in AZ a of the chosen region
resource "aws_subnet" "vpcb-a" {
  vpc_id            = aws_vpc.b.id
  cidr_block        = "10.1.0.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "VPC B - AZ A"
  }
}
#Create subnet in AZ b of the chosen region
resource "aws_subnet" "vpcb-b" {
  vpc_id            = aws_vpc.b.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "${var.region}b"
  tags = {
    Name = "VPC B - AZ B"
  }
}
#Create IGW in VPC
resource "aws_internet_gateway" "vpcb-igw" {
  vpc_id = aws_vpc.b.id
  tags = {
    Name = "VPC B - IGW"
  }
}
#Create route table in VPC
resource "aws_route_table" "vpcb-a" {
  vpc_id = aws_vpc.b.id
  tags = {
    Name = "VPC B - Main Route Table"
  }
}
#Create route to IGW in route table
resource "aws_route" "vpcb-a" {
  route_table_id         = aws_route_table.vpcb-a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpcb-igw.id
  depends_on             = [aws_route_table.vpcb-a]
}
#Make route table the VPC's main route table
resource "aws_main_route_table_association" "vpcb-a" {
  vpc_id         = aws_vpc.b.id
  route_table_id = aws_route_table.vpcb-a.id
}
#Security Group for VPC B
resource "aws_security_group" "vpcb-a" {
  name        = "VPC B - SG"
  description = "Allow SSH and ICMP"
  vpc_id      = aws_vpc.b.id
}
resource "aws_security_group_rule" "vpcb-ssh" {
  type              = "ingress"
  description       = "SSH in"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.vpcb-a.id
}
resource "aws_security_group_rule" "vpcb-icmp" {
  type              = "ingress"
  description       = "ICMP in"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.vpcb-a.id
}
resource "aws_security_group_rule" "vpcb-egress" {
  type              = "egress"
  description       = "All out"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.vpcb-a.id
}
#Create EC2 instances in VPC
resource "aws_instance" "vpcb-a" {
  ami                         = data.aws_ami.amazon-linux-2.id
  subnet_id                   = aws_subnet.vpcb-a.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.vpcb-a.id]
  tags = {
    Name = "VPC B - AZ 1"
  }
}