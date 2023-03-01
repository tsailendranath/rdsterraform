variable "vpc_cidr" {
    type = string
  
}
variable "vpc_tag" {
    type = map(string)
  
}
variable "fithealth_public_sn1_cidr" {
    type = string
}
variable "fithealth_public_sn1_tag" {
    type = map(string)
}
variable "private_db_sn2_cidr" {
    type = string
  
}
variable "private_db_sn2_tag" {
    type = map(string)
  
}
variable "private_db_sn3_cidr" {
    type = string
  
}
variable "private_db_sn3_tag" {
    type = map(string)
  
}
variable "ssh_port" {
    type = number
  
}
variable "sql_port" {
    type = number
}
variable "public_key" {
    type = string
  
}
variable "ec2_config" {
    type = object({
        instance_type = string
        ami = string
        associate_public_ip = bool
        tags = map(string)
    })
}
variable "database_cfg" {
    type = object({
        db_name = string
        engine = string
        username = string
        password = string
        instance_class = string
        tags = map(string)
    })
  
}


















