provider "aws" {
	region= "${var.aws_region}"
}
resource "aws_instance" "blackd" {
	ami="${var.ec2_config["ami"]}"
	instance_type="${var.ec2_config["instance_type"]}"
	key_name="${var.ec2_config["key_name"]}"
	subnet_id="${var.ec2_config["subnet_id"]}"
	vpc_security_group_ids=["${var.ec2_config["security_groups"]}"]
	associate_public_ip_address="true"
	tags={
		Name="DemoInstance"
	}

#	provisioner "remote-exec" {
#		connection {
#			type="ssh"
#			user="ec2-user"
#			#host="${aws_instance.blackd.public_ip}" --this is optional
#			private_key="${file("./POC.pem")}"
#		}
#		inline = [
#			"sudo yum update -y",
#			"sudo yum install httpd -y",
#			"sudo service httpd restart"
#		]
#	}
	
}
output "Public-IP" {
	value="${aws_instance.blackd.public_ip}"
}
