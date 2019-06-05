#Create VPC with given CIDR, and a IGW
resource "aws_vpc" "pocvpc"{
	cidr_block="${var.vpc_cidr}"
	tags={
		Name="POC"
	}
}

resource "aws_internet_gateway" "pocigw"{
	vpc_id="${aws_vpc.pocvpc.id}"
	tags={
		Name="POC IGW"
	}
}

