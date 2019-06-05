output "vpc_id"{
	value="${aws_vpc.pocvpc.id}"
}

output "public_subnet_1_id"{
        value="${aws_subnet.public1.id}"
}

output "public_subnet_2_id"{
        value="${aws_subnet.public2.id}"
}

output "private_subnet_1_id"{
        value="${aws_subnet.private1.id}"
}

output "private_subnet_2_id"{
        value="${aws_subnet.private2.id}"
}

output "web_security_group"{
	value="${aws_security_group.websg.id}"
}

output "alb_security_group"{
        value="${aws_security_group.albsg.id}"
}
