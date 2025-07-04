variable "aws_region" {
  description = "The Home region of Control Tower"
  type        = string
  default     = "ca-central-1" # Organizations API is only available in us-east-1
}