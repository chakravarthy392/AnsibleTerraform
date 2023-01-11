# IAM Policy with assume role to EC2
 data "aws_iam_policy_document" "ec2_assume_role" {
   statement {
     actions = ["sts:AssumeRole"]

     principals {
       type        = "Service"
       identifiers = ["ec2.amazonaws.com"]
     }
   }
 }

 # Configure IAM role
 resource "aws_iam_role" "demo_ec2_admin" {
   name                = "demo-ec2-admin"
   path                = "/"
   assume_role_policy  = data.aws_iam_policy_document.ec2_assume_role.json
 }

 # Configure IAM instance profile
 resource "aws_iam_instance_profile" "demo_ec2_admin" {
   name = "demo-ec2-admin"
   role = aws_iam_role.demo_ec2_admin.name
 }

# Configuration related to IAM policies

 resource "aws_iam_role_policy" "demo_ec2_admin" {
   name = "demo-ec2-admin"
   role = aws_iam_role.demo_ec2_admin.id

   policy = file("./json-policies/demo-ec2-admin.json")
 }

# Allows Lambda function to describe, stop and start EC2 instances
resource "aws_iam_role" "ec2_start_stop_scheduler" {
  name = "ec2_start_stop_scheduler"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "ec2_start_stop_scheduler" {
  statement {
      actions = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
      resources = [
        "arn:aws:logs:*:*:*",
      ]
    }
 statement {
      actions = [
        "autoscaling:SetDesiredCapacity",
      ]
      resources = [
          "*",
      ]
    }
}

resource "aws_iam_policy" "ec2_start_stop_scheduler" {
  name = "ec2_access_scheduler"
  path = "/"
  policy = "${data.aws_iam_policy_document.ec2_start_stop_scheduler.json}"
}

resource "aws_iam_role_policy_attachment" "ec2_access_scheduler" {
  role       = "${aws_iam_role.ec2_start_stop_scheduler.name}"
  policy_arn = "${aws_iam_policy.ec2_start_stop_scheduler.arn}"
}
