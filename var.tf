############################################################ AZURE VAR ############################################################
variable "resource_group_name" {
  description = "Enter Target Resource Group Name"
}

variable "vm_admin_username" {
  description = "User name to use as the admin account on the VMs"
}

variable "vm_admin_password" {
  description = "Default password for admin account"
}

variable "vpn_psk" {
  description = "PSK for Azure VPN Gateways"
}


############################################################ AWS VAR ############################################################
# VPC Var
variable "vpc_cidr" {
  default     = "192.168.0.0/16"
  description = "vpc cidr block"
  type        = string
}

# AZ1 Public Subnet Var
variable "public_subnet_az1_cidr" {
  default     = "192.168.1.0/24"
  description = "public subnet az1 cidr block"
  type        = string
}


# AZ1 Private APP Subnet Var
variable "private_app_subnet_az1_cidr" {
  default     = "192.168.2.0/24"
  description = "private app subnet az1 cidr block"
  type        = string
}


# AZ1 Private Data Subnet Var
variable "private_data_subnet_az1_cidr" {
  default     = "192.168.3.0/24"
  description = "private data subnet az1 cidr block"
  type        = string
}


#Security Groups Var for Bastion (Limit to IP address for SSH)
variable "ssh_location" {
  default     = "0.0.0.0/0"
  description = "SSH IP to ec2 instances"
  type        = string
}


