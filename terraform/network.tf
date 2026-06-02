resource "aws_vpc" "onepercent_vpc_tf" {
  cidr_block       = "10.16.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = {
    Name = "onepercent_vpc"
  }
}

resource "aws_subnet" "onepercent_subnet_tf" {
  vpc_id            = aws_vpc.onepercent_vpc_tf.id
  cidr_block        = "10.16.32.0/20"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "onepercent_subnet"
  }
}

resource "aws_internet_gateway" "gw_one_percent" {
  vpc_id = aws_vpc.onepercent_vpc_tf.id

  tags = {
    Name = "igw-one-percent-tf"
  }
}

resource "aws_route_table" "rt_onepercent" {
  vpc_id = aws_vpc.onepercent_vpc_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_one_percent.id
  }

  tags = {
    Name = "rt-one-percent-tf"
  }
}

resource "aws_route_table_association" "rta_one_percent_subnet" {
  subnet_id      = aws_subnet.onepercent_subnet_tf.id
  route_table_id = aws_route_table.rt_onepercent.id
}

# resource "aws_route_table_association" "rta_one_percent_gw" {
#   gateway_id     = aws_internet_gateway.gw_one_percent.id
#   route_table_id = aws_route_table.rt_onepercent.id
# }