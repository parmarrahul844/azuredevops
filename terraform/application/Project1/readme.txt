# -------------------------
# Virtual Network
# -------------------------


resource "azurerm_virtual_network" "provnet" {
  name                = "Pro-vnet"
  location            = var.location
  resource_group_name = var.rg
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "Project1"
  }
}
# -------------------------
# VM Subnet
# -------------------------

resource "azurerm_subnet" "vm_subnet" {
  name                 = "vm-subnet"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.provnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "pro1-vm"
  resource_group_name = var.rg
  location            = var.location
  size                = "Standard_B1s"

  admin_username = "rahul"

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  disable_password_authentication = true

  admin_ssh_key {
    username   = "rahul"
    public_key = file("/home/azure/.ssh/id_rsa.pub")
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.rg1-identity.id]
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

# -------------------------
# Bastion Subnet
# MUST be AzureBastionSubnet
# -------------------------

resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.provnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
# -------------------------
# Public IP for Bastion
# -------------------------

resource "azurerm_public_ip" "bastion" {
  name                = "bastion-pip"
  location            = var.location
  resource_group_name = var.rg
  allocation_method   = "Static"
  sku                 = "Standard"
}

# -------------------------
# Network Interface
# -------------------------

resource "azurerm_network_interface" "nic" {
  name                = "pro1-nic"
  location            = var.location
  resource_group_name = var.rg

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# -------------------------
# Bastion Host
# -------------------------

resource "azurerm_bastion_host" "bastion" {
  name                = "pro1-bastion"
  location            = var.location
  resource_group_name = var.rg

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.bastion.id
  }
}