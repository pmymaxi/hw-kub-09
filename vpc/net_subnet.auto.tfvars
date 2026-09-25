vpc_network = {
  dev = {
    name = "develop-kub-cls"

    labels = {
      network = "develop-kub-cls"
    }
  }
}

vpc_subnet = {
  dev = {
    manager-net-01 = {
      labels         = { subnet = "kub-net-01" }
      description    = "Подсеть кластера 01"
      route_table    = "route-table-01"
      zone           = "ru-central1-a"
      v4_cidr_blocks = "10.0.1.0/24"
    }
  }
}

route_table = {
  dev = {
    route-table-01 = {
      labels = {
        rt = "develop-kub-cls"
      }

      static_route = {
        destination_prefix = "0.0.0.0/0"
      }
    }
  }
}

gateway = {
  gw = {
    name   = "gw-hw-01"
    labels = { gw = "gateway-01" }
  }
}