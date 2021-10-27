#Create VPC
resource "aws_vpc" "c" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name = "VPC C"
  }
}
#Create subnet in AZ a of the chosen region
resource "aws_subnet" "vpcc-a" {
  vpc_id            = aws_vpc.c.id
  cidr_block        = "10.2.0.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "VPC C - AZ A"
  }
}
#Create subnet in AZ b of the chosen region
resource "aws_subnet" "vpcc-b" {
  vpc_id            = aws_vpc.c.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "${var.region}b"
  tags = {
    Name = "VPC C - AZ B"
  }
}
#Create IGW in VPC
resource "aws_internet_gateway" "vpcc-igw" {
  vpc_id = aws_vpc.c.id
  tags = {
    Name = "VPC C - IGW"
  }
}
#Create route table in VPC
resource "aws_route_table" "vpcc-a" {
  vpc_id = aws_vpc.c.id
  tags = {
    Name = "VPC C - Main Route Table"
  }
}
#Create route to IGW in route table
resource "aws_route" "vpcc-a" {
  route_table_id         = aws_route_table.vpcc-a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpcc-igw.id
  depends_on             = [aws_route_table.vpcc-a]
}
#Make route table the VPC's main route table
resource "aws_main_route_table_association" "vpcc-a" {
  vpc_id         = aws_vpc.c.id
  route_table_id = aws_route_table.vpcc-a.id
}
#Security Group for VPC C
resource "aws_security_group" "vpcc-a" {
  name        = "VPC C - SG"
  description = "Allow SSH and ICMP"
  vpc_id      = aws_vpc.c.id
}
resource "aws_security_group_rule" "vpcc-ssh" {
  type              = "ingress"
  description       = "SSH in"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.vpcc-a.id
}
resource "aws_security_group_rule" "vpcc-icmp" {
  type              = "ingress"
  description       = "ICMP in"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.vpcc-a.id
}
resource "aws_security_group_rule" "vpcc-egress" {
  type              = "egress"
  description       = "All out"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.vpcc-a.id
}
#Create EC2 instances in VPC
resource "aws_instance" "vpcc-a" {
  ami                         = data.aws_ami.amazon-linux-2.id
  subnet_id                   = aws_subnet.vpcc-a.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.vpcc-a.id]
  tags = {
    Name = "VPC C - AZ 1"
  }
}