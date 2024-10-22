resource "aws_subnet" "publicsubnets" {
    vpc_id = aws_vpc.prod.id
    count=3
    cidr_block = element(var.public_cidr_block,count.index)
    availability_zone = element(var.azs,count.index)
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.vpc_name}-public${count.index+1}"
    }
  
}

resource "aws_subnet" "privatesubnets" {
    vpc_id = aws_vpc.prod.id
    count=3
    cidr_block = element(var.private_cidr_block,count.index)
    availability_zone = element(var.azs,count.index)
    
    tags = {
        Name = "${var.vpc_name}-private${count.index+1}"
    }
  
}


