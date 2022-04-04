variable "cpu_core_count" {
  type        = number
  description = "sets the number of CPU cores for an instance"
  default     = null
}

variable "image_id" {
  type        = string
  description = "The id of the AMI to use to provision an EC2 instance"
  
  validation { #fails if it cannot find a match
    condition     = can(regex("^ami-", var.image_id))
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
}

variable "availability_zones" {
  type        = list(string)
  description = "the available availability_zones to provision an EC2 instance"
  default     = ["us-east-1a"]

}
  
variable "tags" {
  type        = map(string)
  description = "a mapping of tags to assign to the resource"
  default     = {}
}

variable "enable_ipv6" {
  type        = bool
  description = "requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC."
  default     = false
}
