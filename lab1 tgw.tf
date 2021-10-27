#Enable this section of code only after doing the VPC peering section
/*
resource "aws_ec2_transit_gateway" "tgw" {
  description = "Immersion Day TGW"
  tags = {
    Name = "TGW"
  }
}
#Create TGW subnets in VPC A
resource "aws_subnet" "tgw-vpca-a" {
  vpc_id            = aws_vpc.a.id
  cidr_block        = "10.0.2.0/28"
  availability_zone = "${var.region}a"
  tags = {
    Name = "VPC A - TGW A"
  }
}
resource "aws_subnet" "tgw-vpca-b" {
  vpc_id            = aws_vpc.a.id
  cidr_block        = "10.0.3.0/28"
  availability_zone = "${var.region}b"
  tags = {
    Name = "VPC A - TGW B"
  }
}
#Create TGW subnets in VPC B
resource "aws_subnet" "tgw-vpcb-a" {
  vpc_id            = aws_vpc.b.id
  cidr_block        = "10.1.2.0/28"
  availability_zone = "${var.region}a"
  tags = {
    Name = "VPC B - TGW A"
  }
}
resource "aws_subnet" "tgw-vpcb-b" {
  vpc_id            = aws_vpc.b.id
  cidr_block        = "10.1.3.0/28"
  availability_zone = "${var.region}b"
  tags = {
    Name = "VPC B - TGW B"
  }
}
#Create TGW subnets in VPC C
resource "aws_subnet" "tgw-vpcc-a" {
  vpc_id            = aws_vpc.c.id
  cidr_block        = "10.2.2.0/28"
  availability_zone = "${var.region}a"
  tags = {
    Name = "VPC C - TGW A"
  }
}
resource "aws_subnet" "tgw-vpcc-b" {
  vpc_id            = aws_vpc.c.id
  cidr_block        = "10.2.3.0/28"
  availability_zone = "${var.region}b"
  tags = {
    Name = "VPC C - TGW B"
  }
}
#TGW Attachments
resource "aws_ec2_transit_gateway_vpc_attachment" "vpca" {
  subnet_ids         = [aws_subnet.tgw-vpca-a.id, aws_subnet.tgw-vpca-b.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.a.id
}
resource "aws_ec2_transit_gateway_vpc_attachment" "vpcb" {
  subnet_ids         = [aws_subnet.tgw-vpcb-a.id, aws_subnet.tgw-vpcb-b.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.b.id
}
resource "aws_ec2_transit_gateway_vpc_attachment" "vpcc" {
  subnet_ids         = [aws_subnet.tgw-vpcc-a.id, aws_subnet.tgw-vpcc-b.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.c.id
}
#Create routes within VPCs to TGW
resource "aws_route" "vpca-tgw" {
  route_table_id         = aws_route_table.vpca-a.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.tgw.id
  depends_on             = [aws_route_table.vpca-a]
}
resource "aws_route" "vpcb-tgw" {
  route_table_id         = aws_route_table.vpcb-a.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.tgw.id
  depends_on             = [aws_route_table.vpcb-a]
}
resource "aws_route" "vpcc-tgw" {
  route_table_id         = aws_route_table.vpcc-a.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.tgw.id
  depends_on             = [aws_route_table.vpcc-a]
}
*/