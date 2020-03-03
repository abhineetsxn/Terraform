provider "aws" {
  region = "us-east-1"
}

terraform {
backend "s3" {
  bucket         = "asg-lb"
  key            = "asg-lb/external.tfstate"
  region         = "us-east-1"
 }
}
######
# Launch configuration and autoscaling group
######
module "asg" {
  source = "../module/asg"

  name = "asg-elb"

  # Launch configuration
  #
  # launch_configuration = "my-existing-launch-configuration" # Use the existing launch configuration
  # create_lc = false # disables creation of launch configuration
  lc_name = "consumer-lc"

  image_id        = "ami-0e2ff28bfb72a4e45"
  instance_type   = "t2.micro"
  #security_groups = [data.aws_security_group.default.id]
  security_groups = ["sg-0181c04cf4b0a3276"]
  #load_balancers  = [module.elb.elb_external.id]
  load_balancers  = [module.elb.this_elb_id]
  key_name	  = "test"
  associate_public_ip_address = "true"
  

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = "50"
      volume_type = "gp2"
    },
  ]



  # Auto scaling group
  asg_name                  = "web-asg"
  #vpc_zone_identifier       = data.aws_subnet_ids.all.ids
  vpc_zone_identifier       = ["subnet-e385bfcd","subnet-6156992c"]
  health_check_type         = "EC2"
  min_size                  = 2 
  max_size                  = 4 
  desired_capacity          = 2
  min_elb_capacity	    = 2
  wait_for_capacity_timeout = 0


  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "megasecret"
      propagate_at_launch = true
    },
  ]
 
  #Auto-Scaling Policy-Scale-up
  auto-scaling-policy-name-scale-up = "cpu-policy-scale-up"
  adjustment-type-scale-up = "ChangeInCapacity"
  scaling-adjustment-scale-up = "1"
  cooldown-scale-up = "300"
  policy-type-scale-up = "SimpleScaling"

  #Auto-Scaling Policy Cloud-Watch Alarm-Scale-Up
  alarm-name-scale-up = "cpu-alarm-scale-up"
  comparison-operator-scale-up = "GreaterThanOrEqualToThreshold"
  evaluation-periods-scale-up = "2"
  metric-name-scale-up = "CPUUtilization"
  namespace-scale-up = "AWS/EC2"
  period-scale-up = "120"
  statistic-scale-up = "Average"
  threshold-scale-up = "70"

  #Auto-Scaling Policy-Scale-down
  auto-scaling-policy-name-scale-down = "cpu-policy-scale-down"
  adjustment-type-scale-down = "ChangeInCapacity"
  scaling-adjustment-scale-down = "-1"
  cooldown-scale-down = "300"
  policy-type-scale-down = "SimpleScaling"

  #Auto-Scaling Policy Cloud-Watch Alarm-Scale-down
  alarm-name-scale-down = "cpu-alarm-scale-down"
  comparison-operator-scale-down = "LessThanOrEqualToThreshold"
  evaluation-periods-scale-down = "2"
  metric-name-scale-down = "CPUUtilization"
  namespace-scale-down = "AWS/EC2"
  period-scale-down = "120"
  statistic-scale-down = "Average"
  threshold-scale-down = "50"
} 

 


######
# ELB
######
module "elb" {
  source = "terraform-aws-modules/elb/aws"

  name = "elb-external"

  subnets         = ["subnet-e385bfcd","subnet-6156992c"]
  security_groups = ["sg-0181c04cf4b0a3276"]
  internal        = false

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}

