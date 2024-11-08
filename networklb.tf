# resource "aws_lb" "kishore2" {
#     name = "kishore2-nlb"
#     internal = false
#     load_balancer_type = "network"
#     security_groups = [aws_security_group.sg.id]
#     subnets=[aws_subnet.publicsubnets[0].id,aws_subnet.publicsubnets[1].id]
#     enable_deletion_protection = false
  
# }

# resource "aws_lb_target_group" "venkat2" {
#     name = "venkat2-tg"
#     port = 8080
#     protocol = "TCP"
#     vpc_id = aws_vpc.prod.id
#     health_check {
#       protocol = "TCP"
#       port = 80
#       interval = 30
#       timeout = 5
#       healthy_threshold = 2
#       unhealthy_threshold = 2
#     }
  
# }

# resource "aws_lb_listener" "ajay2" {
#     load_balancer_arn = aws_lb.kishore2.arn
#     port = 80
#     protocol = "TCP"
#     default_action {
#       type = "forward"
#       target_group_arn = aws_lb_target_group.venkat2.arn
#     }

  
# }

# resource "aws_lb_target_group_attachment" "instance_attachment_1" {
#   target_group_arn   = aws_lb_target_group.venkat2.arn
#   target_id          = aws_instance.prod[0].id
#   port               = 80
# }

# resource "aws_lb_target_group_attachment" "instance_attachment_2" {
#   target_group_arn   = aws_lb_target_group.venkat2.arn
#   target_id          = aws_instance.prod1[0].id
#   port               = 80
# }