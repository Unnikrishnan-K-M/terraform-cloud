
variable "HTTPS_Port" {
   default = "1234"
}

variable "Dev_API_Port" {
     default = "1234"
}

variable "Prod_API_Port" {
     default = "1234"
}

variable "Dev_VPC_cidr_blocks" {
     default = "1.2.3.4"
}

variable "Splunk_cidr_blocks" {
    default = "1.2.3.4"
}

variable "splunk" {
  default = "8088"
}