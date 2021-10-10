variable "instance_type" {
  description = "Instance Type"
  default = "t2.micro"
  type        = string
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
  type        = string
}

variable "key_name" {
  description = "Key Name for SSH key pair"
  type        = string
  default     = "my_ssh_key"
}
