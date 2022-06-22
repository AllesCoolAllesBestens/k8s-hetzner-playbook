variable "master_ips" {
  default = {
    "0" = "10.0.1.10"
    "1" = "10.0.1.11"
    "2" = "10.0.1.12"
    "3" = "10.0.1.13"
    "4" = "10.0.1.14"
    "5" = "10.0.1.15"
  }
}

variable "worker_ips" {
  default = {
    "0" = "10.0.1.20"
    "1" = "10.0.1.21"
    "2" = "10.0.1.22"
    "3" = "10.0.1.23"
    "4" = "10.0.1.24"
    "5" = "10.0.1.25"
  }
}


variable "primary_zone_name" {
  description = "FQDN of Route 53 Hosted Zone"
  type        = string
}

variable "master_domain_prefix" {
  description = "Domain for App"
  type  = string
}

variable "worker_domain_prefix" {
  description = "Domain for App"
  type  = string
}

variable "master_nodes" {
  description = "Domain for App"
  type  = string
}

variable "worker_nodes" {
  description = "Domain for App"
  type  = string
}