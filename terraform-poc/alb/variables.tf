variable "alb_name"{
	default="myalb"
}

variable "internal"{
	default="true"
}

variable "target_group_name"{
	default="POCTG"
}
variable "vpc_id"{}
variable "subnet_ids"{
	type="list"
}
variable "security_group_ids"{
	type="list"
}
variable "backend_instance_id"{}
