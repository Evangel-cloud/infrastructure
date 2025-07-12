############################
# 1. VPC
############################
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

############################
# 2. Internet Gateway
############################
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

############################
# 3. Public Subnets
############################
resource "aws_subnet" "public" {
  for_each                = { for idx, subnet in var.public_subnets : idx => subnet }
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name = "public-webapp-subnet-${each.key}"
    Tier = "public-app"
  }
}

############################
# 4. Private Subnets (App)
############################
resource "aws_subnet" "private_app" {
  for_each         = { for idx, subnet in var.private_app_subnets : idx => subnet }
  vpc_id           = aws_vpc.main.id
  cidr_block       = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "private-app-subnet-${each.key}"
    Tier = "private-app"
  }
}

############################
# 5. Private Subnets (DB)
############################
resource "aws_subnet" "private_db" {
  for_each         = { for idx, subnet in var.private_db_subnets : idx => subnet }
  vpc_id           = aws_vpc.main.id
  cidr_block       = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "private-db-subnet-${each.key}"
    Tier = "private-db"
  }
}

############################
# 6. Public Route Table + Associations
############################
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0" #route 0.0.0.0/0 point to internet gateway so any subnet associated will have internet access
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

############################
# 7. Private Route Table + Associations (no internet route)
############################
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

resource "aws_route_table_association" "private_app" {
  for_each       = aws_subnet.private_app
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_db" {
  for_each       = aws_subnet.private_db
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}