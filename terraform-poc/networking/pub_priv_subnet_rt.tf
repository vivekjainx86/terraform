# Create 2 Public Subnets in seperate AZs
resource "aws_subnet" "public1"{
	vpc_id="${aws_vpc.pocvpc.id}"
	cidr_block="${var.public_subnet1_cidr}"
	availability_zone="${element(var.availability_zones,0)}"
	tags={
		Name="PublicSubnet1"
	}
}

resource "aws_subnet" "public2"{
        vpc_id="${aws_vpc.pocvpc.id}"
        cidr_block="${var.public_subnet2_cidr}"
        availability_zone="${element(var.availability_zones,1)}"
        tags={
                Name="PublicSubnet2"
        }
}

# Create 2 Private Subnets in seperate AZs
resource "aws_subnet" "private1"{
        vpc_id="${aws_vpc.pocvpc.id}"
        cidr_block="${var.private_subnet1_cidr}"
        availability_zone="${element(var.availability_zones,0)}"
        tags={
                Name="PrivateSubnet1"
        }
}

resource "aws_subnet" "private2"{
        vpc_id="${aws_vpc.pocvpc.id}"
        cidr_block="${var.private_subnet2_cidr}"
        availability_zone="${element(var.availability_zones,1)}"
        tags={
                Name="PrivateSubnet2"
        }
}

# Create a Public route table and associate with Public Subnets
# We don't need to create private route table as a default private route table is already attached with all subnets
resource "aws_route_table" "public_rt"{
	vpc_id="${aws_vpc.pocvpc.id}"
	
	route {
		cidr_block="0.0.0.0/0"
		gateway_id="${aws_internet_gateway.pocigw.id}"
	}
	tags={
		Name="PublicRT"
	}
}

resource "aws_route_table_association" "public1_rt_a"{
	subnet_id="${aws_subnet.public1.id}"
	route_table_id="${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "public2_rt_a"{
        subnet_id="${aws_subnet.public2.id}"
        route_table_id="${aws_route_table.public_rt.id}"
}

