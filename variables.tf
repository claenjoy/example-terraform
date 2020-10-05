variable "portsexternal" {
  default = "8080"
}
variable "name" {
  type= string
  default = "my"
}



/*variable "instance_tag" {
  type = object({
     Name = string
     foo = number
  })

}*/

# bar.out.tfvars will be included 