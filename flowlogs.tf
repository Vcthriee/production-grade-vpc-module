
resource "aws_cloudwatch_log_group" "flow" {
  name = "/vpc/flowlogs"
}

resource "aws_iam_role" "flow_role" {
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = { Service = "vpc-flow-logs.amazonaws.com" },
      Effect = "Allow"
    }]
  })
}

resource "aws_flow_log" "main" {
  vpc_id          = aws_vpc.main.id
  traffic_type    = "ALL"
  log_destination = aws_cloudwatch_log_group.flow.arn
  iam_role_arn    = aws_iam_role.flow_role.arn
}
