/*output "PORT_EXTERNAL" {
  value = docker_container.nginx.ports[0].external
  description = "the external port used by this container "
}*/

output "IP_ADDRESS" {
  value = docker_container.cust_jenkins.ip_address
}

/*output "image-registry"{
    value = data.docker_registry_image.nginx.name

}*/