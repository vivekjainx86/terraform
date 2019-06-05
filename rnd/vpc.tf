provider "aws" {
	region="ap-south-1"
}

#resource "aws_vpc" "myvpc"{
#	cidr_block="10.1.0.0/16"
#
#	tags={
#		Name="MyVPC"
#	}
#}

resource "aws_route_table" "demort"{
	vpc_id="vpc-0e350807df6544b79"
	route{
		cidr_block="0.0.0.0/0"
		gateway_id="igw-01907edae946116a4"
	}
}
