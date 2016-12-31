variable "access_key" {}
variable "secret_key" {}

variable "project" {
  type = "string"
  default = "dpo-monitoring"
}

variable "key_name" {
  type = "string"
  default = "dpo-monitoring"
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
    eu-central-1 = "ami-211ada4e"
  }
}

