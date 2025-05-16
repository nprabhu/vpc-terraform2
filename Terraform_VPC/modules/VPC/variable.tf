variable "cidr_block_range" {
  description = "vpc2_name"
  type        = string
}
variable "cidr_subnet_range" {
  description = "SubNet CIDRS Range"
  type        = list(string)
}
variable "subnets_name" {
  description = "VPC SubNet Names"
  type        = list(string)
  default     = ["Public_SubNet01", "Public_SubNet02"]
}
