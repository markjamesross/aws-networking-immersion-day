#Enable after completing Lab3 CloudWatch
/*
#Create Cloudtrail
resource "aws_cloudtrail" "trail" {
  name                          = "NetworkImmersionDayTrail"
  enable_log_file_validation    = true
  s3_bucket_name                = aws_s3_bucket.trail.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
}
#S3 bucket for CloudTrail
resource "aws_s3_bucket" "trail" {
  bucket        = "networkimmersiondaytrail-${data.aws_caller_identity.current.account_id}"
  acl           = "private"
  force_destroy = true
  policy        = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::networkimmersiondaytrail-${data.aws_caller_identity.current.account_id}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::networkimmersiondaytrail-${data.aws_caller_identity.current.account_id}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
#Block Public Access
resource "aws_s3_bucket_public_access_block" "trail" {
  bucket                  = aws_s3_bucket.trail.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
*/