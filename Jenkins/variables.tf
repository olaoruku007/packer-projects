variable "region" {
  description = "The region the resources will be launched"
  type        = string
  default     = "us-east-2"
}

variable "image_id" {
  description = " The ami to be used by the instance"
  type        = string
  default     = "ami-053adc4c0eb651c6f"
}

variable "instance_type" {
  description = " The instance type to be used"
  type        = string
  default     = "t2.medium"
}


variable "server_port" {
  description = " The port the server will use for http request"
  type        = number
  default     = 22

}

variable "server_port1" {
  description = " The port the server will use for http request"
  type        = number
  default     = 8080

}