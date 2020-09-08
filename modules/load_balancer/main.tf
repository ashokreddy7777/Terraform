resource "aws_lb" "lb" {
    name                       = var.name
    internal                   = var.internal
    load_balancer_type         = var.load_balancer_type
    security_groups            = var.security_groups
    subnets                    = var.subnets
    enable_deletion_protection = var.enable_deletion_protection
    tags                       = var.lb_tags
}

resource "aws_lb_listener" "http_to_https" {
    load_balancer_arn = aws_lb.lb.arn 
    port              = "80"
    protocol          = "HTTP"

    default_action {
        type = "redirect"

        redirect {
            port        = "443"
            protocol    = "HTTPS"
            status_code = "HTTP_301"
        }
    }
}

resource "aws_lb_listener" "https" {
    load_balancer_arn = aws_lb.lb.arn 
    port              = "443"
    protocol          = "HTTPS"
    ssl_policy        = "ELBSecurityPolicy-2016-08"
    certificate_arn   = "arn:aws:acm:us-east-1:306593415795:certificate/10c9634c-a144-4acf-a6f2-93bf17e1b14c"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.lb_tg.arn 
    }  
}

resource "aws_lb_target_group" "lb_tg" {
    name     = var.name
    port     = "80"
    protocol = "HTTP"
    vpc_id   = var.vpc_id
}