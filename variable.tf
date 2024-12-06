variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_1" {
  description = "CIDR block for Public Subnet 1"
  type        = string
  default = "10.0.0.0/22"
}

variable "public_subnet_cidr_2" {
  description = "CIDR block for Public Subnet 2"
  type        = string
  default = "10.0.4.0/22"
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for Private Subnet 1"
  type        = string
  default = "10.0.8.0/22"
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for Private Subnet 2"
  type        = string
  default = "10.0.12.0/22"
}

variable "availability_zone_1" {
  description = "Availability Zone for Subnet 1"
  type        = string
  default = "ap-south-1a"
}

variable "availability_zone_2" {
  description = "Availability Zone for Subnet 2"
  type        = string
  default = "ap-south-1b"
}

variable "Key_Frontend" {
  description = "Kay Pair for frontend"
  type        = string
  default     = "new-backend-cli"
}

variable "Key_Backend" {
  description = "Kay Pair for backend"
  type        = string
  default     = "new-backend-cli"
}

variable "Backend_AMI" {
  default     = "ami-06f86a645dfd1b0f7"
}

variable "Frontend_AMI" {
  default     = "ami-06aca2fdf0ecceb55"
}
