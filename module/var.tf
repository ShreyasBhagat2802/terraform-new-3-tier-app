# Variables For VPC infrastructure
variable "region" {
  description = "region for vpc"
}

variable "vpc_cidr" {
  description = "CIDR for vpc"
  type        = string
}

variable "public_subnet_cidr_1" {
  description = "CIDR block for Public Subnet 1"
  type        = string
}

variable "public_subnet_cidr_2" {
  description = "CIDR block for Public Subnet 2"
  type        = string
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for Private Subnet 1"
  type        = string
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for Private Subnet 2"
  type        = string
}

variable "availability_zone_1" {
  description = "Availability Zone for Subnet 1"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability Zone for Subnet 2"
  type        = string
}

variable "Key_Frontend" {
  description = "Kay Pair for frontend"
  type        = string
}

variable "Key_Backend" {
  description = "Kay Pair for backend"
  type        = string
}

variable "Backend_AMI" {
  description = "ami for backend"
  type        = string
}

variable "Frontend_AMI" {
  description = "ami for forntend"
  type        = string
}
