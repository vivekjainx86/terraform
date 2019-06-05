variable "region"{
	default="ap-south-1"
}

variable "availability_zones"{
	default=["ap-south-1a","ap-south-1b"]
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

