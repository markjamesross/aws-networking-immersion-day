#Enable only after completing lab1 and Cloudformation
/*
#Create AWS representation of Customer gateway in on-premise environment
resource "aws_customer_gateway" "vpngw" {
  bgp_asn    = 65000
  ip_address = aws_cloudformation_stack.on-premise.outputs.PublicIp
  type       = "ipsec.1"
  tags = {
    Name = "Onpremise VPN"
  }
}
#Create AWS VPC resource
resource "aws_vpn_connection" "on-premise" {
  customer_gateway_id = aws_customer_gateway.vpngw.id
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  type                = aws_customer_gateway.vpngw.type
  static_routes_only  = true
  tags = {
    Name = "Onpremise VPN"
  }
}
#Print outputs of the tunnel addresses as these will be entered into the on-premise VPN server
output "tunnel1_address" {
  value = aws_vpn_connection.on-premise.tunnel1_address
}
output "tunnel2_address" {
  value = aws_vpn_connection.on-premise.tunnel2_address
}
#Create route to route traffic for on-premise via the VPN
resource "aws_ec2_transit_gateway_route" "vpn" {
  destination_cidr_block         = "10.10.0.0/16"
  transit_gateway_attachment_id  = aws_vpn_connection.on-premise.transit_gateway_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.tgw.association_default_route_table_id
}
*/