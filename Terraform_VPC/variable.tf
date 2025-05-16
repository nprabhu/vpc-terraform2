variable "cidr_block_range" {
  description = "vpc2_name"
  type        = string
}
variable "cidr_subnet_range" {
  description = "SubNet CIDRS Range"
  type        = list(string)

}

variable "ec2_names" {
  description = "Names for EC2 Instances"
  type        = list(string)
}