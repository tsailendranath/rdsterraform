output "jumpbox_public_ip" {
    value = aws_instance.jumpbox.public_ip
    description = "public ip address"
  
}

output "database_dns" {
  value = aws_db_instance.testdb.endpoint
  description = "rds endpoint for connection"
}

