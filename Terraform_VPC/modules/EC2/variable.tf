variable "subnets" {
  description = "Subnets for EC2"
  type        = list(string)
}

variable "sg_id" {
  description = "SG Id For EC2"
  type        = string
}

variable "ec2_names" {
    description = "Names for EC2 Instances"
    type = list(string)
}