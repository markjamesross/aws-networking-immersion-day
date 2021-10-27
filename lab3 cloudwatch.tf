#Enable after completing Lab3 VPC flow logs
/*
#Create CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "vpc_down" {
  alarm_name                = "NetworkImmersionDay-VPNAlarm"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "TunnelState"
  namespace                 = "AWS/VPN"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = "0"
  alarm_description         = "This metric monitors VPN tunnel"
  insufficient_data_actions = []
  alarm_actions             = [aws_sns_topic.vpn_down.arn]
  dimensions = {
    TunnelIpAddress = aws_vpn_connection.on-premise.tunnel1_address
  }
}
#SNS Topic for CloudWatch Alarm
resource "aws_sns_topic" "vpn_down" {
  name = "NetworkImmersionDay-VPNAlarm"
}
resource "aws_sns_topic_subscription" "vpn_down" {
  topic_arn = aws_sns_topic.vpn_down.arn
  protocol  = "email"
  endpoint  = var.email_address
}
#CloudWatch Dashboard
resource "aws_cloudwatch_dashboard" "vpn" {
  dashboard_name = "NetworkImmersionDayVPN-Dashboard"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "properties": {
        "metrics": [
          [
            "AWS/VPN",
            "TunnelState",
            "TunnelIpAddress",
            "${aws_vpn_connection.on-premise.tunnel1_address}"
          ],
          [
            "AWS/VPN",
            "TunnelState",
            "TunnelIpAddress",
            "${aws_vpn_connection.on-premise.tunnel2_address}"
          ]
        ],
        "period": 60,
        "stat": "Average",
        "region": "${var.region}",
        "title": "VPN Tunnel Status",
        "view": "singleValue"
      }
    },
    {
      "type": "metric",
      "properties": {
        "metrics": [
          [
            "AWS/VPN",
            "TunnelDataIn",
            "TunnelIpAddress",
            "${aws_vpn_connection.on-premise.tunnel1_address}"
          ],
          [
            "AWS/VPN",
            "TunnelDataOut",
            "TunnelIpAddress",
            "${aws_vpn_connection.on-premise.tunnel1_address}"
          ]
        ],
        "period": 60,
        "stat": "Average",
        "region": "${var.region}",
        "title": "Tunnel 1 Data In/Out"
      }
    },
    {
      "type": "metric",
      "properties": {
        "metrics": [
          [
            "AWS/VPN",
            "TunnelDataIn",
            "TunnelIpAddress",
            "${aws_vpn_connection.on-premise.tunnel2_address}"
          ],
          [
            "AWS/VPN",
            "TunnelDataOut",
            "TunnelIpAddress",
            "${aws_vpn_connection.on-premise.tunnel2_address}"
          ]
        ],
        "period": 60,
        "stat": "Average",
        "region": "${var.region}",
        "title": "Tunnel 2 Data In/Out"
      }
    }
  ]
}
EOF
}
*/