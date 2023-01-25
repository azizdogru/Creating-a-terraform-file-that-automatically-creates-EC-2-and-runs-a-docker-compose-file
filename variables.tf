//variable "aws_secret_key" {}
//variable "aws_access_key" {}
variable "mykey" {
  default = "firstkey"
}
variable "myami" {
  default = "ami-0778521d914d23bc1"
  description = "Ubuntu 20.04"
}
variable "instancetype" {
  default = "t2.micro"
}
variable "tags" {
  default = "Docker_compose_Server"
}
variable "mysecgr" {
  default = "docker-compose-server-sec-gr"
}

variable "user" {
  default = "aziz"
}


