resource "aws_lb_listener" "alb" {
  load_balancer_arn = var.load_balancer_arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = module.s3_bucket.s3_bucket_arn # Reemplaza con la ruta de tu archivo PEM en S3

  default_action {
    type             = var.lb_listener_default_action_type
    target_group_arn = var.lb_listener_default_action_target_group_arn
  }

  depends_on = [ module.s3_bucket ]
}