variable "aws_region" {
	default="ap-south-1"
}

variable "instance_name" {}

variable "amis" {
	default= {
		"ap-south-1"="ami-0ad42f4f66f6c1cc9"
	}
}

variable "instance_type" {
        default="t2.micro"
}

variable "key_name" {
        default="POC"
}

variable "subnet_id" {
        default="subnet-017db8341648b99f0"
}

variable "security_groups" {
        default="sg-0f0dc5713b2b43359"
}
