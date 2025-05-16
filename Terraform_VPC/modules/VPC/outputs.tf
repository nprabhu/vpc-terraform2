output "vpc2_id" {
  description = "Getting VPC ID for SG"
  value       = aws_vpc.npd_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.vpc_subnets.*.id
}
