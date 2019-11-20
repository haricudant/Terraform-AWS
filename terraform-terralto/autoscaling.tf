resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix          = "example-launchconfig"
  image_id             = "${lookup(var.AMIS, var.REGION)}"
  instance_type        = "t2.micro"
  key_name             = "${aws_key_pair.samplekey.key_name}"
  security_groups      = ["${aws_security_group.myinstance.id}"]
  user_data            = "#!/bin/bash\nsudo yum -y install httpd\nsudo service httpd start\necho Hello > /var/www/html/index.html"
  lifecycle              { create_before_destroy = true }

}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                 = "example-autoscaling"
  vpc_zone_identifier  = ["${aws_subnet.main-private-1.id}"]
  launch_configuration = "${aws_launch_configuration.example-launchconfig.name}"
  min_size             = 2
  max_size             = 4
  health_check_grace_period = 300
  health_check_type = "EC2"
  load_balancers = ["${aws_elb.my-elb.name}"]
  force_delete = true

  tag {
      key = "Name"
      value = "ec2 instance"
      propagate_at_launch = true
  }
}

