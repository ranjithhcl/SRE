variable "aws_region" {
  description = "EC2 Region for the VPC"
  type        = string
  default     = "eu-central-1"
}

variable "project" {
  description = "The resource project"
  type        = string
  default     = "myproject"
}

variable "environment" {
  description = "Environment for the resource"
  type        = string
  default     = "team1"
}
