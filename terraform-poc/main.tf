provider "aws"{
	region="${var.region}"
}

module "vpc_networking"{
	source="./networking"
	vpc_cidr="${var.vpc_cidr}"
	public_subnet1_cidr="${var.public_subnet1_cidr}"
	public_subnet2_cidr="${var.public_subnet2_cidr}"
	private_subnet1_cidr="${var.private_subnet1_cidr}"
	private_subnet2_cidr="${var.private_subnet2_cidr}"
}

module "ec2_instance"{
	source="./ec2_instance"
	instance_name="ApacheServer"
	ec2_key_name="${var.ec2_key_name}"
	subnet_id="${module.vpc_networking.public_subnet_1_id}"
	# Comma seperated list of security group ids
	ec2_security_group_ids="${module.vpc_networking.web_security_group}"
}

module "front_alb"{
	source="./alb"
	vpc_id="${module.vpc_networking.vpc_id}"
	internal="false"
	subnet_ids="${list("${module.vpc_networking.public_subnet_1_id}","${module.vpc_networking.public_subnet_2_id}")}"
	security_group_ids="${list("${module.vpc_networking.alb_security_group}")}"
	backend_instance_id="${module.ec2_instance.web_server_instance_id}"
}
