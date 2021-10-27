#Enable this section of code only after doing initial ping testing between instances
/*
resource "aws_vpc_peering_connection" "a-b" {
  peer_vpc_id   = aws_vpc.b.id
  vpc_id        = aws_vpc.a.id
  auto_accept   = true
  tags = {
    Name = "VPC Peering VPC A and VPC B"
  }
}
resource "aws_vpc_peering_connection" "a-c" {
  peer_vpc_id   = aws_vpc.c.id
  vpc_id        = aws_vpc.a.id
  auto_accept   = true
  tags = {
    Name = "VPC Peering VPC A and VPC C"
  }
}
#Create Peer routes for VPC A
resource "aws_route" "vpca-peer-a-b" {
  route_table_id            = aws_route_table.vpca-a.id
  destination_cidr_block    = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.a-b.id
  depends_on                = [aws_route_table.vpca-a]
}
resource "aws_route" "vpca-peer-a-c" {
  route_table_id            = aws_route_table.vpca-a.id
  destination_cidr_block    = "10.2.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.a-c.id
  depends_on                = [aws_route_table.vpca-a]
}
#Create Peer routes for VPC B
resource "aws_route" "vpca-peer-b-a" {
  route_table_id            = aws_route_table.vpcb-a.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.a-b.id
  depends_on                = [aws_route_table.vpcb-a]
}
#Create Peer routes for VPC B
resource "aws_route" "vpca-peer-c-a" {
  route_table_id            = aws_route_table.vpcc-a.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.a-c.id
  depends_on                = [aws_route_table.vpcc-a]
}
*/