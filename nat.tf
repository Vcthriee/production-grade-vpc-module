

# ELASTIC IPs FOR NAT GATEWAYS

# Static public IP for NAT in AZ A
resource "aws_eip" "nat_a" {
  domain = "vpc" # required for VPC EIP
}

# Static public IP for NAT in AZ B
resource "aws_eip" "nat_b" {
  domain = "vpc"
}

# NAT GATEWAYS (one per AZ)

# NAT placed in PUBLIC subnet A
# Private subnet A will route through this
resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_a.id      # attach the EIP
  subnet_id     = aws_subnet.public_a.id # must be PUBLIC subnet

  depends_on = [aws_internet_gateway.igw] # ensure IGW exists first

  tags = {
    Name = "${var.project_name}-nat-a"
  }
}


# NAT placed in PUBLIC subnet B
# Private subnet B will route through this
resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.nat_b.id
  subnet_id     = aws_subnet.public_b.id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "${var.project_name}-nat-b"
  }
}
