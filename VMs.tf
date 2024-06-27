############################################################ AZURE VMs ############################################################
######### VM in HUB Public Subnet East US #########
resource "azurerm_public_ip" "centralus_public_ip" {
    name                = "centralus-public-SPOKE-1-pip"
    location            = "centralus"
    resource_group_name = var.resource_group_name
    sku                 = "Standard"
    allocation_method   = "Static" 
}

resource "azurerm_network_interface" "centralus_public" {
  name                = "centralus-vm-SPOKE-1-nic"
  location            = "centralus"
  resource_group_name = var.resource_group_name
  enable_accelerated_networking = "true"

  ip_configuration {
    name                          = "public-centralus-SPOKE-1-VM"
    subnet_id                     = azurerm_subnet.public_subnet_central_1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.centralus_public_ip.id
    
  }
}

resource "azurerm_windows_virtual_machine" "centralus_public" {
  name                = "CENTRAL-1"
  resource_group_name = var.resource_group_name
  location            = "centralus"
  size                = "Standard_Ds1_v2"
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  network_interface_ids = [azurerm_network_interface.centralus_public.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

######### VM in Onsite Public Subnet West US 2 #########
resource "azurerm_public_ip" "westus2_public_ip" {
    name                = "westus2-uspublic-ONSITE-1-pip"
    location            = "West US 2"
    resource_group_name = var.resource_group_name
    sku                 = "Standard"
    allocation_method   = "Static" 
}

resource "azurerm_network_interface" "westus2_public" {
  name                = "westus2-vm-ONSITE-1-nic"
  location            = "West US 2"
  resource_group_name = var.resource_group_name
  enable_accelerated_networking = "true"

  ip_configuration {
    name                          = "public-westus2-ONSITE-1-VM"
    subnet_id                     = azurerm_subnet.public_subnet_west_1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.westus2_public_ip.id
    
  }
}

resource "azurerm_windows_virtual_machine" "westus2_public" {
  name                = "ONSITE-1"
  resource_group_name = var.resource_group_name
  location            = "West US 2"
  size                = "Standard_Ds1_v2"
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  network_interface_ids = [azurerm_network_interface.westus2_public.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}



############################################################ AWS VMs ############################################################
resource "aws_instance" "vm" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.ssh.id]
  subnet_id                   = aws_subnet.public_subnet_az1.id
  associate_public_ip_address = true
  ##key_name = aws_key_pair.ssh_key.key_name
}
output "aws_vm_public_ip" {
  value = aws_instance.vm.public_ip
}
output "aws_vm_private_ip" {
  value = aws_instance.vm.private_ip
}