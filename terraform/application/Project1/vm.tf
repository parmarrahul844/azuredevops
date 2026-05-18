resource "azurerm_windows_virtual_machine" "pro1_vm" {
  name                = "pro1-vm-01"
  resource_group_name = var.rg
  location            = var.location
  size                = "Standard_D2s_v3" # widely available VM size
  admin_username      = "azureuser"
  admin_password      = "Admin123" # must meet Azure password rules

  network_interface_ids = [
    azurerm_network_interface.vm1_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.rg1-identity.id]
  }

  # No Availability Set or Zone → No infrastructure redundancy required

  depends_on = [
    azurerm_network_interface.vm1_nic,
    azurerm_user_assigned_identity.rg1-identity
  ]

  tags = {
    environment = "Project1"
  }
}



































# resource "azurerm_linux_virtual_machine" "pro1_vm" {
#   name                = "pro1-vm-01"
#   resource_group_name = var.rg
#   location            = var.location
#   size                = "Standard_B2s"
#   admin_username      = "rahul"
#   network_interface_ids = [
#     azurerm_network_interface.vm1_nic.id
#   ]

#   disable_password_authentication = true

#   admin_ssh_key {
#     username   = "rahul"
#     public_key = file("/home/azure/.ssh/id_rsa.pub")
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }

#   identity {
#     type         = "UserAssigned"
#     identity_ids = [azurerm_user_assigned_identity.rg1-identity.id]
#   }
#   # No Availability Set or Zone → "No infrastructure redundancy required"
# }