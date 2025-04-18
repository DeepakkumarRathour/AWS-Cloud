
provider "aws" {
    region ="is-east-1"
}

provider "azurerm"{
    subscription_id= "azure-subscription-id"
    client_id = "your-auzre-client-id"
    client_scecret= "your-azure-client-secret"
    tenant_id = "your-azure-tenant-id"
}


resource "aws_instance" "server01"{

    ami="ami-0123456789abcdf0"
    instance_type="t2.micro"
}

resource "azure_virtual_machine" "server02" { 
    name = "example-vm"
    location = "eastus"
    size = "Standard_A1"
}





