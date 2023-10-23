output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnets" {
  value = join(",", [aws_subnet.public_1.id, aws_subnet.public_2.id, aws_subnet.public_3.id])
}

output "private_subnets" {
  value = join(",", [aws_subnet.private_1.id, aws_subnet.private_2.id, aws_subnet.private_3.id])
}

resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.environment}/central/vpc/id"
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "vpc_cidr" {
  name  = "/${var.project}/${var.environment}/central/vpc/cidr"
  type  = "String"
  value = aws_vpc.main.cidr_block
}

resource "aws_ssm_parameter" "public_subnets_ids" {
  name  = "/${var.project}/${var.environment}/central/vpc/publicSubnetIds"
  type  = "StringList"
  value = join(",", [aws_subnet.public_1.id, aws_subnet.public_2.id, aws_subnet.public_3.id])
}

resource "aws_ssm_parameter" "private_subnets_ids" {
  name  = "/${var.project}/${var.environment}/central/vpc/privateSubnetIds"
  type  = "StringList"
  value = join(",", [aws_subnet.private_1.id, aws_subnet.private_2.id, aws_subnet.private_3.id])
}
