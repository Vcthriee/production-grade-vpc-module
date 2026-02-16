
# Security group for ALB (public traffic)
resource "aws_security_group" "alb" {
  name   = "${var.environment}-alb-sg"
  vpc_id = aws_vpc.main.id
}

# Allow HTTP inbound
resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# Security group for app
resource "aws_security_group" "app" {
  name   = "${var.environment}-app-sg"
  vpc_id = aws_vpc.main.id
}
