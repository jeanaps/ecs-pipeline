#### Public Subnets

# Public Subnet on us-east-1a
resource "aws_subnet" "public_subnet_us_west-2a" {
  vpc_id                  = "${aws_vpc.cluster_vpc.id}"
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

  tags = {
    Name = "${var.cluster_name}-public-subnet-1a"
  }
}

# Public Subnet on us-east-1b
resource "aws_subnet" "public_subnet_us_west-2b" {
  vpc_id                  = "${aws_vpc.cluster_vpc.id}"
  cidr_block              = "10.0.16.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2b"

  tags = {
    Name = "${var.cluster_name}-public-subnet-1b"
  }
}

# Associate subnet public_subnet_us_east_1a to public route table
resource "aws_route_table_association" "public_subnet_us_west-2a_association" {
  subnet_id      = "${aws_subnet.public_subnet_us_west-2a.id}"
  route_table_id = "${aws_vpc.cluster_vpc.main_route_table_id}"
}

# Associate subnet public_subnet_us_east_1b to public route table
resource "aws_route_table_association" "public_subnet_us_west-2b_association" {
  subnet_id      = "${aws_subnet.public_subnet_us_west-2b.id}"
  route_table_id = "${aws_vpc.cluster_vpc.main_route_table_id}"
}
