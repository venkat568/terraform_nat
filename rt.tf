resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.prod.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "${var.vpc_name}-public_rt"
    }
  
}

resource "aws_route_table_association" "public_associate" {
    count=3
    route_table_id = aws_route_table.public_rt.id
    subnet_id = element(aws_subnet.publicsubnets.*.id,count.index) 
}


resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.prod.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat.id
    }
    tags = {
        Name = "${var.vpc_name}-private_rt"
    }
  
}

resource "aws_route_table_association" "private_associate" {
    count=3
    route_table_id = aws_route_table.private_rt.id
    subnet_id = element(aws_subnet.privatesubnets.*.id,count.index) 
}