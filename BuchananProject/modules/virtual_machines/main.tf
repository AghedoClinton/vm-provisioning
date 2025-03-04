resource "azurerm_network_interface" "bt-nic" {
  name                = "${var.virtual_machine_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "bt-vm" {
  name                  = var.virtual_machine_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.virtual_machine_size
  admin_username        = "ClintonAghedo"
  network_interface_ids = [azurerm_network_interface.bt-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "ClintonAghedo"
    public_key = file("~/.ssh/bt.pub")
  }
}