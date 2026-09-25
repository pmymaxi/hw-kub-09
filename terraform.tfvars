vpc_config = {
  name_network = "dev"
  name_subnet  = "manager-net-01"
  name_sg      = "dev"
}

each_vm = [
  {
    count            = 1
    hostname         = "kube-master"
    vm_name          = "kube-master"
    user             = "ubuntu"
    family           = "ubuntu-2404-lts"
    platform_id      = "standard-v3"
    zone             = "ru-central1-a"
    cpu              = 4
    ram              = 4
    core_fraction    = 20
    disk_size        = 15
    disk_type        = "network-hdd"
    disk_auto_delete = true
    preemptible      = true
    nat              = true
    #ip_address        = "10.0.1.7"
    allow_stop_update = true
  },
  {
    count            = 4
    hostname         = "kube-node"
    vm_name          = "kube-node"
    user             = "ubuntu"
    family           = "ubuntu-2404-lts"
    platform_id      = "standard-v3"
    zone             = "ru-central1-a"
    cpu              = 4
    ram              = 4
    core_fraction    = 20
    disk_size        = 15
    disk_type        = "network-hdd"
    disk_auto_delete = true
    preemptible      = true
    nat              = false
    #ip_address        = "10.0.1.9"
    allow_stop_update = true
  }
]

vms_resources_metadata = {
  metadata = {
    serial-port-enable = "1"
  }
}