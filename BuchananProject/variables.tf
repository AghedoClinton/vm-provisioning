variable "resource_group_name" {
  type    = string
  default = "buchanan-technologies-rg"
}
variable "virtual_machine_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "location" {
  type    = string
  default = "Central US"
}
variable "subnet_name" {
  type    = string
  default = "buchanan-technologies-subnet"
}

variable "vnet_name" {
  type    = string
  default = "buchanan-technologies-vnet"
}

variable "virtual_machine_name" {
  type    = string
  default = "buchanan-technologies-vm"
}

variable "security_group_name" {
  type    = string
  default = "buchanan-technologies-sq"
}
