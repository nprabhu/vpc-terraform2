variable "sg_id" {
  description = "SG id for Application load balancer"
  type        = string

}

variable "subnet_ids" {
  description = "Subnet Id for ALB"
  type        = list(string)
}

variable "vpc2_id" {
  description = "VPC id for ALB Target group"
  type        = string
}

variable "instance_ids" {
  description = "Instances id for ALB Target group Attachement"
  type        = list(string)
}
