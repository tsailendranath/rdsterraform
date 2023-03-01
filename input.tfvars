vpc_cidr = "10.0.0.0/16"
vpc_tag = {
  "Name" = "fithealth-vpc"
}
fithealth_public_sn1_cidr = "10.0.1.0/24"
fithealth_public_sn1_tag = {
  "Name" = "fithealth-pub-sn1"
}

private_db_sn2_cidr = "10.0.2.0/24"
private_db_sn2_tag = {
  "Name" = "private-sn2"
}
private_db_sn3_cidr = "10.0.3.0/24"
private_db_sn3_tag = {
  "Name" = "private-sn3"
}
ssh_port = 22

sql_port = 3306
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCeDAbXNgd0+sQXqWwBqT0qYR16+x8KcUX4UMFJ2AY9NzE6jzueeR2fk7iH6oVwRrysMm9BGvbZ9c+27nwfmZAMCk6VLRBigA6DPVGAV25ebQp9CdKSKncIDtt88z0clH+ktvjsdztt/cURWS6p59ylDo7NNBbE0kVU8Tlhqo9h9sjoOA4H4iI5zWAhVjLobmE0fxDyqlpKRG+oaabI2lkHfZYBbW9D5BrbAhm9MWcuW0lUgmdJw8Monid1v8KPjXu06kQrOr0KPAhsBvRn6xTPwpT2Ljv5m0M4Bk75h+K6Twd36SdsLNBkQKZr+NYyYAckm5/zVhMAfgHfLeFjJt58dfQnRrPdFDHaqEsr3h0WwpxeTatNiZA82NUMJ57hBUvDCEfLzeu1EikFPt6v9tAz57sTSkZrx/HfKBklcxtoJTJ0Bsa3v2exbANXIEDtVQJnSp9d1PvgGEZJrXw3kEf10h1UKHUBC/V5SPwh4undQLocxMAzeYbL8SpIFBgfOV0= thaku@SN-THAKUR"

ec2_config = {
  ami = "ami-0f8ca728008ff5af4"
  associate_public_ip = true
  instance_type = "t2.micro"
  tags = {
    "key" = "testing-ec2"
  }
}

database_cfg = {
  db_name = "testdb"
  engine = "mysql"
  instance_class = "db.t2.micro"
  password = "welcome#123"
  tags = {
    "Name" = "my-database"
  }
  username = "root"
}






















