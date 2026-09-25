resource "terraform_data" "kubespray" {
  depends_on = [
    local_file.kubespray_inventory
  ]

  triggers_replace = [
    sha256(local_file.kubespray_inventory.content)
  ]

  provisioner "local-exec" {
    working_dir = "${path.module}/ansible/kubespray"

    command = <<-EOT
      set -e

      echo "=============================================="
      echo " Waiting for SSH"
      echo "=============================================="

      for i in $(seq 1 60); do
        echo "SSH check $i/60..."

        if ansible all \
          -i inventory/local/hosts.ini \
          -m raw \
          -a 'echo SSH_OK' \
          -T 5 \
          --one-line
        then
          echo "All nodes are reachable."
          break
        fi

        if [ "$i" -eq 60 ]; then
          echo "ERROR: SSH is not available on all nodes."
          exit 1
        fi

        sleep 10
      done

      echo ""
      echo "=============================================="
      echo " Waiting for cloud-init"
      echo "=============================================="

      ansible all \
        -i inventory/local/hosts.ini \
        -b \
        -e 'ansible_python_interpreter=/usr/bin/python3' \
        -m shell \
        -a 'timeout 600 cloud-init status --wait'

      echo ""
      echo "=============================================="
      echo " Ansible ping"
      echo "=============================================="

      ansible all \
        -i inventory/local/hosts.ini \
        -e 'ansible_python_interpreter=/usr/bin/python3' \
        -m ping \
        -T 5

      echo ""
      echo "=============================================="
      echo " Starting Kubespray"
      echo "=============================================="

      ansible-playbook \
        -i inventory/local/hosts.ini \
        -b \
        -e 'ansible_python_interpreter=/usr/bin/python3' \
        cluster.yml

      echo ""
      echo "=============================================="
      echo " Kubespray finished successfully"
      echo "=============================================="
    EOT

    interpreter = ["/bin/bash", "-c"]
  }
}