data "archive_file" "lambda_code" {
  type        = "zip"
  source_dir  = "${path.module}/code"
  output_path = "${path.module}/code.zip"
}

resource "aws_lambda_function" "my_lambda_function" {
  function_name = var.name
  runtime       = var.runtime
  handler       = "lambda_function.lambda_handler"
  filename      = data.archive_file.lambda_code.output_path
  role          = aws_iam_role.lambda_execution_role.arn
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "LambdaExecutionRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "dynamodb_policy" {
  name = "DynamoDBPolicy"

  policy = jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:PutItem",
        "dynamodb:GetItem",
        "dynamodb:UpdateItem",
        "dynamodb:DeleteItem"
      ],
      "Resource": var.dynamodb_table_arn
    }
  ]
})
}

resource "aws_iam_role_policy_attachment" "dynamodb_policy_attachment" {
  policy_arn = aws_iam_policy.dynamodb_policy.arn
  role       = aws_iam_role.lambda_execution_role.name
}
