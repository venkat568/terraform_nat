resource "aws_instance" "prod" {
    count =1
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids =[aws_security_group.sg.id]
    subnet_id = aws_subnet.privatesubnets[0].id
    private_ip = var.private_ip
    user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    sudo systemctl start apache2
    EOF
    tags = {
        Name = "${var.vpc_name}-pubserver"
    }
  
}


resource "aws_instance" "prod1" {
    count =1
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids =[aws_security_group.sg.id]
    subnet_id = aws_subnet.publicsubnets[0].id
    associate_public_ip_address = true
    user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    sudo systemctl start apache2
    EOF
    tags = {
        Name = "${var.vpc_name}-privateserver"
    }
  
}