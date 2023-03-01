terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}
provider "aws" {
    profile = "default"
    region = "ap-south-1"
  
}
resource "aws_vpc" "fithealthvpc" {
    cidr_block = var.vpc_cidr
    tags = {
        "Name" = "var.vpc_tag"
    }
}
resource "aws_subnet" "fithealth_public_sn1" {
    vpc_id = aws_vpc.fithealthvpc.id
    cidr_block = var.fithealth_public_sn1_cidr
    availability_zone = "ap-south-1a"
    tags = {
      "Name" = "fithealth_public_sn1_tag"
    }
  
}
resource "aws_subnet" "private_db_sn2" {
    vpc_id = aws_vpc.fithealthvpc.id
    cidr_block = var.private_db_sn2_cidr
    availability_zone = "ap-south-1a"
    tags = {
      "Name" = "var.private_db_sn2_tag"
    }
  
}
resource "aws_subnet" "private_db_sn3" {
    vpc_id = aws_vpc.fithealthvpc.id
    cidr_block = var.private_db_sn3_cidr
    availability_zone = "ap-south-1b"
    tags = {
      "Name" = "var.private_db_sn3_tag"
    }
}
resource "aws_internet_gateway" "fithealth_ig" {
    vpc_id = aws_vpc.fithealthvpc.id
    tags = {
      "Name" = "fithealth_ig"
    }
  
}
resource "aws_route_table" "fithealth_ig_rt" {
    vpc_id = aws_vpc.fithealthvpc.id
    route {
        gateway_id = aws_internet_gateway.fithealth_ig.id
        cidr_block = "0.0.0.0/0"
    }
    tags = {
      "Name" = "fithealth_ig_rt"
    }
  
}
resource "aws_route_table_association" "subnet_ass" {
    route_table_id = aws_route_table.fithealth_ig_rt.id
    subnet_id = aws_subnet.fithealth_public_sn1.id
    
  
}
resource "aws_security_group" "fithealth_pub_sg" {
    vpc_id = aws_vpc.fithealthvpc.id
    tags = {
      "Name" = "fithealth_pub_sg"
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = var.ssh_port
        to_port = var.ssh_port
        protocol = "tcp"
    }
    egress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        to_port = 0
        protocol = -1
    }
    
}
resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.fithealthvpc.id
  tags = {
    "Name" = "rds_sg"
  }
    ingress {
        from_port = var.sql_port
        to_port = var.sql_port
        cidr_blocks = [ var.vpc_cidr ]
        protocol = "tcp"
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]

    }
}

resource "aws_key_pair" "testkp" {
    key_name = "testkp"
    public_key = var.public_key
  
}
resource "aws_instance" "jumpbox" {
    subnet_id = aws_subnet.fithealth_public_sn1.id
    instance_type = var.ec2_config.instance_type
    ami = var.ec2_config.ami
    associate_public_ip_address = var.ec2_config.associate_public_ip
    vpc_security_group_ids = [aws_security_group.fithealth_pub_sg.id]
    tags = {
        "Name" = "var.ec2_config.tags[]"
    }
    key_name = aws_key_pair.testkp.id
}
resource "aws_db_subnet_group" "db_sn_gr" {
    subnet_ids = [aws_subnet.private_db_sn2.id, 
    aws_subnet.private_db_sn3.id]
    tags = {
        "Name" = "db_sn_gr"
    }
}
resource "aws_db_instance" "testdb" {
    vpc_security_group_ids = [ aws_security_group.rds_sg.id ]
    db_subnet_group_name = aws_db_subnet_group.db_sn_gr.name
    allocated_storage = 10
    db_name = var.database_cfg.db_name
    engine = var.database_cfg.engine
    engine_version = "8.0.31"
    instance_class = var.database_cfg.instance_class
    username = var.database_cfg.username
    password = var.database_cfg.password
    skip_final_snapshot = true
    tags = {
      "Name" = "var.database_cfg.tags"
    }
  
}


















































