/* resource "yandex_lb_target_group" "kubernetes_api" {
  name      = "kubernetes-api"
  region_id = "ru-central1"

  dynamic "target" {
    for_each = {
      for key, vm in yandex_compute_instance.kuber-cluster :
      key => vm
      if startswith(vm.hostname, "kube-master-")
    }

    content {
      subnet_id = target.value.network_interface[0].subnet_id
      address   = target.value.network_interface[0].ip_address
    }
  }
}

resource "yandex_lb_network_load_balancer" "kubernetes_api" {
  name = "kubernetes-api"
  type = "internal"

  listener {
    name        = "kubernetes-api"
    port        = 6443
    target_port = 6443
    protocol    = "tcp"

    internal_address_spec {
      subnet_id = local.network[
        var.vpc_config.name_network
        ].subnet[
        var.vpc_config.name_subnet
      ].subnet_id

      ip_version = "ipv4"
      address    = "10.0.1.10"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.kubernetes_api.id

    healthcheck {
      name                = "kubernetes-api"
      interval            = 5
      timeout             = 2
      healthy_threshold   = 2
      unhealthy_threshold = 3

      tcp_options {
        port = 6443
      }
    }
  }
} */