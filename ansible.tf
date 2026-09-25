resource "local_file" "kubespray_inventory" {
  filename = "${path.module}/ansible/kubespray/inventory/local/hosts.ini"

  content = templatefile(
    "${path.module}/tpl/kubespray-hosts.ini.tftpl",
    {
      vms = local.kubespray_inventory
    }
  )
}
