security_group = {
    name = "sg-kub-cls"
}

security_group_ingress = {

  sg_in_main = [

    {
      protocol       = "TCP"
      description    = "SSH"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 22
    },

    {
      protocol       = "TCP"
      description    = "Kubernetes API Server"
      v4_cidr_blocks = ["10.0.1.0/24"]
      port           = 6443
    },

    {
      protocol       = "TCP"
      description    = "etcd client/server"
      v4_cidr_blocks = ["10.0.1.0/24"]
      from_port      = 2379
      to_port        = 2380
    },

    {
      protocol       = "TCP"
      description    = "Kubelet API"
      v4_cidr_blocks = ["10.0.1.0/24"]
      port           = 10250
    },

    {
      protocol       = "TCP"
      description    = "kube-proxy"
      v4_cidr_blocks = ["10.0.1.0/24"]
      port           = 10256
    },

    {
      protocol       = "TCP"
      description    = "HTTP"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 80
    },

    {
      protocol       = "TCP"
      description    = "HTTPS"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 443
    }
  ]
}

security_group_egress = {
   sg_out_main = [ 
    {
      protocol       = "TCP"
      description    = "разрешить весь исходящий трафик"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 0
      to_port        = 65365
    }

   ]
}