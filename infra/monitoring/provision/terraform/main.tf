provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_key_pair" "monitoring" {
  key_name = "${var.key_name}"
  public_key = "${file("${var.key_name}.pub")}"
}

resource "aws_subnet" "monitoring" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.private_subnet}"
  map_public_ip_on_launch = "true"

  tags {
    Name = "${var.project} subnet"
    Project = "${var.project}"
  }
}

resource "aws_instance" "monitoring" {
  key_name = "${var.key_name}"
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.monitoring.id}"

  vpc_security_group_ids = [
    "${aws_security_group.monitoring.id}"
  ]

  tags {
     Name = "${var.project}"
     Project = "${var.project}"
     Owner = "${var.owner}"
  }
}

output "ip" {
  value = "${aws_instance.monitoring.public_ip}"
}








