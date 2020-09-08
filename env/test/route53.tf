resource "aws_route53_record" "point_to_lb" {
    zone_id = "Z04848302J76KXGFQ1XL6"
    name = "www.srilakshmi-groups.com"
    type = "A"

    alias {
      name = module.load_balancer.lb_dns_name
      zone_id = module.load_balancer.lb_zone_id
      evaluate_target_health = false
      
    }
    allow_overwrite = true
  
}