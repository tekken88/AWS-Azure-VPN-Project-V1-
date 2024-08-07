############################################################ AZURE Variables ############################################################
variable "resource_group_name" {
  description = "Enter Target Resource Group Name"
}

variable "vm_admin_username" {
  description = "User name to use as the admin account on the VMs"
}

variable "vm_admin_password" {
  description = "Default password for admin account"
  sensitive   = true
}

variable "vpn_psk" {
  description = "PSK for Azure VPN Gateways"
  default     = "ABC123"
  sensitive   = true
}



########### East US ###########
### VNet Hub 1 "Front End" Configuration 
variable "east_hub_vnet_1_location" {
  description = "East Hub Vnet 1 Location"
  default     = "East US"
}

variable "east_hub_vnet_1_name" {
  description = "East Hub Vnet 1 Name"
  default     = "hub_1_eastus"
}

variable "east_hub_vnet_1_address" {
  description = "East Hub 1 Vnet Address Space"
  default     = "10.0.0.0/16"
  type        = string
}

#Gateway Subnet for VPN
variable "east_hub_vnet_gateway_subnet_address" {
  description = "East Hub 1 Gateway Subnet Address Space"
  default     = "10.0.3.0/24"
  type        = string
}

#Public Subnets
variable "east_hub_vnet_pub1_address" {
  description = "East Hub 1 Public Subnet 1"
  default     = "10.0.1.0/24"
  type        = string
}

variable "east_hub_vnet_pub1_name" {
  description = "East Hub 1 Public Subnet 1 Name"
  default     = "public-subnet-east-1"
}

#Private Subnets
variable "east_hub_vnet_private1_address" {
  description = "East Hub 1 Private Subnet 1"
  default     = "10.0.2.0/24"
  type        = string
}

variable "east_hub_vnet_private1_name" {
  description = "East Hub 1 Private Subnet 1 name"
  default     = "private-subnet-east-1"
}



########### Central US ###########
## Back End Spoke VNET "Workload 1" Configuration 
variable "centralus_workload_spoke_vnet_1_location" {
  description = "Central US Workload VNET 1 Location"
  default     = "Central US"
}

variable "centralus_workload_spoke_vnet_1_name" {
  description = "Central Workload VNET 1 Name"
  default     = "workload1_centralus"
}

variable "centralus_workload_spoke_vnet_1_address" {
  description = "Central Workload VNET 1 Address Space"
  default     = "10.2.0.0/16"
  type        = string
}

#Private Subnets
variable "centralus_workload_private1_address" {
  description = "Central Workload Private Subnet 1 Address Space"
  default     = "10.2.2.0/24"
  type        = string
}

variable "centralus_workload_private1_name" {
  description = "Central Workload Private Subnet 1 name"
  default     = "private-workload-subnet-central-1"
}




########### West US 2 ###########
##VNet "ONSITE SIMULATION" Configuration 
variable "west_onsite_vnet_1_location" {
  description = "West ONSITE Vnet 1 Location"
  default     = "West US 2"
}

variable "west_onsite_vnet_1_name" {
  description = "West ONSITE Vnet 1 Name"
  default     = "westus2_onsite1"
}

variable "west_onsite_vnet_1_address" {
  description = "West ONSITE 1 Vnet Address Space"
  default     = "10.1.0.0/16"
  type        = string
}

#Gateway Subnet for VPN
variable "west_onsite_vnet_gateway_subnet_address" {
  description = "West ONSITE 1 Gateway Subnet Address Space"
  default     = "10.1.3.0/24"
  type        = string
}

#Public Subnets
variable "west_onsite_vnet_pub1_address" {
  description = "West ONSITE 1 Public Subnet 1"
  default     = "10.1.1.0/24"
  type        = string
}

variable "west_onsite_vnet_pub1_name" {
  description = "West ONSITE 1 Public Subnet 1 Name"
  default     = "public-subnet-east-1"
}

#Private Subnets
variable "west_onsite_vnet_private1_address" {
  description = "West ONSITE 1 Private Subnet 1"
  default     = "10.1.2.0/24"
  type        = string
}

variable "west_onsite_vnet_private1_name" {
  description = "West ONSITE 1 Private Subnet 1 name"
  default     = "private-subnet-east-1"
}


############################################################ AWS Variables ############################################################
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


