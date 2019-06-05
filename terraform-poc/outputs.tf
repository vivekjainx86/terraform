output "Web-Server-Public-IP"{
	value="${module.ec2_instance.web_server_public_ip}"
}

output "ALB-Public-DNS"{
	value="${module.front_alb.alb_public_dns}"
}
