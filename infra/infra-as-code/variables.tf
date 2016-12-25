variable "access_key" {}
variable "secret_key" {}
variable "application_ami" {}

variable "project" {
  type = "string"
  default = "dpo-application"
}

variable "key_name" {
  type = "string"
  default = "dpo-application"
}

variable "region" {
  default = "eu-central-1"
}

variable "vpc_id" {
  type = "string"
}

variable "owner" {
  type = "string"
}

variable "private_subnet" {
  type = "string"
}


variable "amis" {
  type = "map"
  default = {
    eu-central-1 = "ami-a98140c6"  //"ami-8504fdea"
  }
}

variable "node_count" {
  type = "string"
  default = "2"
}
