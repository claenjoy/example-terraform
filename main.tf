terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }

  }
    # Configure the Azure Provider
  
 /* backend "azurerm" {
    resource_group_name =  "my-resources"
    storage_account_name = "mystorageaccount854"
    container_name       = "my-vhds"
    key                  = "terraform.tfstate"
    subscription_id      = "b63582fe-6299-4942-959a-2b8a03b8b420"
 ##   tenant_id            = "018567ba-0458-4e88-95c0-05dc36aed410"

   }*/
}



  


/*# Configure the GitHub Provider
provider "github" {
  token = "${var.github_token}"
  owner = "${var.github_owner}"
}*/

provider "docker" {}

resource "docker_image" "cust_jenkins" {
  name         = "jenkins/jenkins:lts"
  keep_locally = true
}

resource "docker_container" "cust_jenkins" {
  image = docker_image.cust_jenkins.latest
  name  = "${var.name}-JENKINS"
  user = "root"
  ports {
   internal = 8080
   external = var.portsexternal
  }
  ports {
    internal = 5000
    external = 5000
  }
    mounts {
    target    = "/var/jenkins_home"
    source    = "/var/jenkins_home"
    type      = "bind"
    read_only = false
  }

}



/*data "docker_registry_image" "nginx" {
  name = "ubuntu-java_sshd:latest"
}*/


###### AZURE  ###

 provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "~>2.20.0"
  features {}





}
# Create a resource group
resource "azurerm_resource_group" "rg2" {
  name     = "${var.name}-resources"
  location = "UK South"
}

resource "azurerm_storage_account" "storage1" {
  name                     = "${var.name}storageaccount854"
  resource_group_name      = azurerm_resource_group.rg2.name
  location                 = azurerm_resource_group.rg2.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "container1" {
  name                  = "${var.name}-vhds"
  storage_account_name  = azurerm_storage_account.storage1.name
  container_access_type = "private"
}



