# Create Security group for ALB allowing access from Internet on Port 80
resource "aws_security_group" "albsg"{
	name="ALB Security Group"
	description="Allows web access from Internet"
	vpc_id="${aws_vpc.pocvpc.id}"
	ingress{
		from_port=80
		to_port=80
		protocol="tcp"
		cidr_blocks=["0.0.0.0/0"]
	}
	egress{
		from_port=0
		to_port=0
		protocol="-1"
		cidr_blocks=["0.0.0.0/0"]
	}
}

#Create Security group for Web server allowing web access from ALB and SSH access from Internet
resource "aws_security_group" "websg"{
        name="Web Server Security Group"
        description="Allows web access from ALB only and SSH access from Internet"
        vpc_id="${aws_vpc.pocvpc.id}"
        ingress{
                from_port=22
                to_port=22
                protocol="tcp"
                cidr_blocks=["0.0.0.0/0"]
        }
	ingress{
                from_port=80
                to_port=80
                protocol="tcp"
                security_groups=["${aws_security_group.albsg.id}"]
        }
        egress{
                from_port=0
                to_port=0
                protocol="-1"
                cidr_blocks=["0.0.0.0/0"]
        }
}

