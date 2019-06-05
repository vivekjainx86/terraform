resource "aws_instance" "web_server" {
        ami="${lookup(var.ec2_amis,var.region)}"
        instance_type="${var.ec2_instance_type}"
        key_name="${var.ec2_key_name}"
        subnet_id="${var.subnet_id}"
        vpc_security_group_ids=["${var.ec2_security_group_ids}"]
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

