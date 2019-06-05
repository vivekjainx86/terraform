variable "region"{
	default="ap-south-1"
}

variable "vpc_cidr"{
	default="10.0.0.0/16"
}

variable "public_subnet1_cidr"{
	default="10.0.1.0/24"
}

variable "public_subnet2_cidr"{
	default="10.0.2.0/24"
}

variable "private_subnet1_cidr"{
        default="10.0.3.0/24"
}

variable "private_subnet2_cidr"{
        default="10.0.4.0/24"
}

variable "ec2_amis"{
        default={
		"ap-south-1"="ami-0ad42f4f66f6c1cc9"
	}
}

variable "ec2_instance_type"{
        default="t2.micro"
}

variable "ec2_key_name"{
	default="POC"
}

