#Enable after completing Lab4
/*
#Create S3 bucket
resource "aws_s3_bucket" "vpce" {
  bucket        = "vpce-${data.aws_caller_identity.current.account_id}"
  acl           = "private"
  force_destroy = true
}
#Block Public Access
resource "aws_s3_bucket_public_access_block" "vpce" {
  bucket                  = aws_s3_bucket.vpce.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
#Create S3 endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.a.id
  service_name = "com.amazonaws.${var.region}.s3"
  #Choose correct policy based on where you are in the lab
  policy = <<POLICY
{
    "Statement": [
        {
            "Sid": "ReadOnlyAccess",
            "Principal": "*",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
POLICY
  
#  policy = <<POLICY
#{
#    "Statement": [
#        {
#            "Sid": "ReadOnlyAccess",
#            "Principal": "*",
#            "Action": [
#                "s3:Get*",
#                "s3:List*",
#                "s3:Put*"
#            ],
#            "Effect": "Allow",
#           "Resource": "*"
#       }
#  ]
#}
#POLICY

}
#Associate Endpoint with Route Table
resource "aws_vpc_endpoint_route_table_association" "a" {
  route_table_id  = aws_route_table.vpca-a.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}
*/