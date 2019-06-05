#Create a ALB for the Web tier
resource "aws_lb" "pocalb"{
	name="${var.alb_name}"
	internal="${var.internal}"
	load_balancer_type="application"
	security_groups=["${var.security_group_ids}"]
	subnets=["${var.subnet_ids}"]
}

# Create a Target group which listens on port 80
resource "aws_lb_target_group" "webtg"{
	name="${var.target_group_name}"
	port=80
	protocol="HTTP"
	vpc_id="${var.vpc_id}"
}

# Create a ALB listener on port 80 which forwards the requests to specified target group
resource "aws_lb_listener" "pocalb_listener"{
	load_balancer_arn="${aws_lb.pocalb.arn}"
	port="80"
	protocol="HTTP"
	default_action={
		type="forward"
		target_group_arn="${aws_lb_target_group.webtg.arn}"
	}
}

# Attach your backend ec2 instance to the target group
resource "aws_lb_target_group_attachment" "tgbackend"{
	target_group_arn="${aws_lb_target_group.webtg.arn}"
	target_id="${var.backend_instance_id}"
	port=80
}
