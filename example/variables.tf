variable "aws_region" {
	default="ap-south-1"
}
variable "ec2_config" {
	type= "map"
	
	default={
		"ami"="ami-0ad42f4f66f6c1cc9"
		"instance_type"="t2.micro"
		"key_name"="MyKey"
		"subnet_id"="subnet-017db8341648b99f0"
		"security_groups"="sg-0f0dc5713b2b43359"
	}
}
