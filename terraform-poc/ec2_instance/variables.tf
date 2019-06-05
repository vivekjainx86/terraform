variable "region"{
	default="ap-south-1"
}

variable "ec2_amis"{
	default={
		"ap-south-1"="ami-0ad42f4f66f6c1cc9"
	}
}

variable "ec2_instance_type"{
	default="t2.micro"
}

variable "instance_name"{
	default="WebServer"
}

# Security groups should be comma seperated list without space
variable "ec2_security_group_ids"{}
variable "ec2_key_name"{}
variable "subnet_id"{}

