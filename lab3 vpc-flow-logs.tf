#Enable after completing Lab2
/*
#Create CloudWatch log group
resource "aws_cloudwatch_log_group" "vpc-flow-logs" {
  name = "NetworkImmersionDayFlowLog"

  tags = {
    Name = "NetworkImmersionDayFlowLog"
  }
}
#Flow log for VPCA
resource "aws_flow_log" "vpc-a" {
  iam_role_arn             = aws_iam_role.flow-logs-role.arn
  log_destination          = aws_cloudwatch_log_group.vpc-flow-logs.arn
  traffic_type             = "ALL"
  vpc_id                   = aws_vpc.a.id
  max_aggregation_interval = 60
}
#IAM Role and Policy for flow logs
resource "aws_iam_role" "flow-logs-role" {
  name = "flowlogsRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "flow-logs-policy" {
  name = "flow-logs-policy"
  role = aws_iam_role.flow-logs-role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
#Add Security group rule for iPerf
resource "aws_security_group_rule" "vpcb-iperf" {
  type              = "ingress"
  description       = "iPerf in"
  from_port         = 5201
  to_port           = 5201
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.vpcb-a.id
}
*/