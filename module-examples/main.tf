provider "aws" {
        region= "${var.aws_region}"
}

module "apache_server" {
	source = "./apache_instance"
	instance_name = "MyServer"
}

output "Public-IP" {
	value="${module.apache_server.public_ip}"
}
