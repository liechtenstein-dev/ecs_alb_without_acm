variable "load_balancer_arn" {
  description = "The ARN of the load balancer"
  type = string
}

variable "lb_listener_default_action_type" {
  description = "The type of the default action"
  type = string
}

variable "lb_listener_default_action_target_group_arn" {
  description = "The ARN of the target group"
  type = string
}

variable "bucket_openssl_name" {
  description = "The name of the bucket to store the PEM file"
  type = string
}

variable "bucket_alb_name" {
  description = "The name of the bucket to store the ALB logs"
  type = string
}

