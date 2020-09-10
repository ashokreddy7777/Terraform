output "lb_id" {
    value = "${aws_lb.lb.id}"
}

output "tg_arn" {
    value = "${aws_lb_target_group.lb_tg.arn}"
}

output "lb_dns_name" {
    value = "${aws_lb.lb.dns_name}"
}

output "lb_zone_id" {
    value = "${aws_lb.lb.zone_id}"
}