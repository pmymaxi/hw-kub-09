/* output "vm_count_for" {
  value = [
    for out in concat(local.webserver, local.databases, local.storage, local.bastion) :
    {
      "name" = out.name
      "id"   = out.id
      "fqdn" = out.fqdn
    }
  ]
} */