locals {
  vm_each = merge([
    for vm in var.each_vm : {
      for i in range(vm.count) :
      "${vm.vm_name}-${i + 1}" => merge(vm, {
        index = i + 1
      })
    }
  ]...)
}

locals {
  kubespray_inventory = {
    for key, vm in yandex_compute_instance.kuber-cluster :
    key => {
      hostname   = vm.hostname
      private_ip = vm.network_interface[0].ip_address
      public_ip  = vm.network_interface[0].nat_ip_address
    }
  }
}

/*Создаем переменную в которую пробрасываем public key ssh с использованием дополнительной 
функцией pathexpand для определениия полного пути по ~, будем указывать в metadata instance */
locals {
  vms_ssh_public_root_key = file(pathexpand("~/.ssh/id_ed25519.pub"))
}