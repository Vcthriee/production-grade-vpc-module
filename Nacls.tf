
resource "aws_network_acl" "private_app" {
  vpc_id = aws_vpc.main.id
}

resource "aws_network_acl_rule" "app_allow_all_out" {
  network_acl_id = aws_network_acl.private_app.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
}
