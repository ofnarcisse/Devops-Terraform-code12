variable "allocated_storage" {
 default = 10 
}
variable "backup_retention_period" {
 description = "How long backup should be kept" 
 default = 0
}
variable "db_name" {
  description = "Name of the initial database"
  default = "devdb"
}
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "5.7"
}
variable "identifier" {
 default = "dev-database" 
}
variable "password" {
   sensitive = true 
  
}
variable "username" {
  sensitive = true
}
variable "instance_class" {
 default =  "db.t3.micro" 
}
variable "region" {
 default = "us-east-1"
}
variable "skip_final_snapshot" {
 default = true 
}
variable "parameter_group_name" {
 default = "default.mysql5.7" 
}
