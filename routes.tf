
# PUBLIC ROUTE TABLE
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

# PRIVATE APP ROUTES
resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "private_a_nat" {
  route_table_id         = aws_route_table.private_a.id
  nat_gateway_id         = aws_nat_gateway.nat_a.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "app_a" {
  subnet_id      = aws_subnet.private_app_a.id
  route_table_id = aws_route_table.private_a.id
}


resource "aws_route_table" "private_b" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "private_b_nat" {
  route_table_id         = aws_route_table.private_b.id
  nat_gateway_id         = aws_nat_gateway.nat_b.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "app_b" {
  subnet_id      = aws_subnet.private_app_b.id
  route_table_id = aws_route_table.private_b.id
}


# DB ROUTE TABLE (LOCAL ONLY)

resource "aws_route_table" "db" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table_association" "db_a" {
  subnet_id      = aws_subnet.private_db_a.id
  route_table_id = aws_route_table.db.id
}

resource "aws_route_table_association" "db_b" {
  subnet_id      = aws_subnet.private_db_b.id
  route_table_id = aws_route_table.db.id
}
