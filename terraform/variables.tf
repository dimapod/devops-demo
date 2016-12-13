variable "access_key" {}
variable "secret_key" {}

variable "project" {
  type = "string"
  default = "gs-spring"
}

variable "key_name" {
  type = "string"
  default = "gs-devops"
  default = "gs-devops"
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
