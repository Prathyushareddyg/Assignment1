resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "first_vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "first_subnet"
  }
}

resource "aws_nat_gateway" "main" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.main.id
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${var.vpc_id}"
  tags = {
    Name = "first_internet_gw"
  }
}

output "vpc_id"{
    value = "${aws_vpc.main.id}"
}