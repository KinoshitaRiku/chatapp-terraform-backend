resource "aws_subnet" "public_1a" {
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.0.0/24"
  tags = {
    Name = "chatapp-public-1a"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-northeast-1c"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "chatapp-private-1c"
  }
}

resource "aws_subnet" "private_1d" {
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-northeast-1d"
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name = "chatapp-private-1d"
  }
}