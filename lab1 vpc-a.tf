#Create VPC
resource "aws_vpc" "a" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC A"
  }
}
#Create subnet in AZ a of the chosen region
resource "aws_subnet" "vpca-a" {
  vpc_id            = aws_vpc.a.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "VPC A - AZ A"
  }
}
#Create subnet in AZ b of the chosen region
resource "aws_subnet" "vpca-b" {
  vpc_id            = aws_vpc.a.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.region}b"
  tags = {
    Name = "VPC A - AZ B"
  }
}
#Create IGW in VPC
resource "aws_internet_gateway" "vpca-igw" {
  vpc_id = aws_vpc.a.id
  tags = {
    Name = "VPC A - IGW"
  }
}
#Create route table in VPC
resource "aws_route_table" "vpca-a" {
  vpc_id = aws_vpc.a.id
  tags = {
    Name = "VPC A - Main Route Table"
  }
}
#Create route to IGW in route table
resource "aws_route" "vpca-a" {
  route_table_id         = aws_route_table.vpca-a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpca-igw.id
  depends_on             = [aws_route_table.vpca-a]
}
#Make route table the VPC's main route table
resource "aws_main_route_table_association" "vpca-a" {
  vpc_id         = aws_vpc.a.id
  route_table_id = aws_route_table.vpca-a.id
}
#Security Group for VPC A
resource "aws_security_group" "vpca-a" {
  name        = "VPC A - SG"
  description = "Allow SSH and ICMP"
  vpc_id      = aws_vpc.a.id
  tags = {
    Name = "VPC A - SG"
  }
}
resource "aws_security_group_rule" "vpca-ssh" {
  type              = "ingress"
  description       = "SSH in"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.vpca-a.id
}
resource "aws_security_group_rule" "vpca-icmp" {
  type        = "ingress"
  description = "ICMP in"
  from_port   = 8
  to_port     = 0
  protocol    = "icmp"
  #Choose which CIDR block based on which part of the labs you're doing
  cidr_blocks = ["0.0.0.0/0"]
  #cidr_blocks       = ["10.2.0.0/16"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.vpca-a.id
}
resource "aws_security_group_rule" "vpca-egress" {
  type              = "egress"
  description       = "All out"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.vpca-a.id
}
#Create EC2 instances in VPC
resource "aws_instance" "vpca-a" {
  ami                         = data.aws_ami.amazon-linux-2.id
  subnet_id                   = aws_subnet.vpca-a.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.vpca-a.id]
  tags = {
    Name = "VPC A - AZ 1"
  }
}