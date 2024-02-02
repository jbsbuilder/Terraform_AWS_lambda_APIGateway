provider "aws" {
  region = "us-east-1"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "lambda"
  output_path = "lambda.zip"
}

resource "aws_iam_role" "lambda-iam" {
  name = "lambda-iam"
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