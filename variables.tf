


# GLOBAL PROJECT VARIABLES

variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
}

variable "project_name" {
  description = "Project or company name used for tagging resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}


# VPC
variable "main_vpc" {
  description = "CIDR block for the main VPC"
  type        = string
}

# AVAILABILITY ZONES (diagram shows 2 AZs)
variable "az_1" {
  description = "Primary availability zone"
  type        = string
}

variable "az_2" {
  description = "Secondary availability zone"
  type        = string
}

# PUBLIC SUBNETS (for ALB + NATs)

variable "public_subnet_a_cidr" {
  description = "CIDR block for public subnet in AZ-A"
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for public subnet in AZ-B"
  type        = string
}

# PRIVATE APP SUBNETS (containers/compute)

variable "private_app_subnet_a_cidr" {
  description = "CIDR block for private app subnet in AZ-A"
  type        = string
}

variable "private_app_subnet_b_cidr" {
  description = "CIDR block for private app subnet in AZ-B"
  type        = string
}

# PRIVATE DB SUBNETS (isolated databases)

variable "private_db_subnet_a_cidr" {
  description = "CIDR block for private DB subnet in AZ-A"
  type        = string
}

variable "private_db_subnet_b_cidr" {
  description = "CIDR block for private DB subnet in AZ-B"
  type        = string
}
