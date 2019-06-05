resource "aws_instance" "apache_server" {
	ami="${lookup(var.amis,var.aws_region)}"
	instance_type="${var.instance_type}"
	key_name="${var.key_name}"
	subnet_id="${var.subnet_id}"
	vpc_security_group_ids=["${var.security_groups}"]
	associate_public_ip_address="true"
	tags={
		Name="${var.instance_name}"
	}

	provisioner "remote-exec" {
		connection {
			type="ssh"
			user="ec2-user"
			#host="${aws_instance.apache_server.public_ip}" --this is optional
			private_key="${file("./files/POC.pem")}"
		}
		inline = [
			"sudo yum update -y",
			"sudo yum install httpd -y",
			"sudo service httpd restart"
		]
	}
	
}
