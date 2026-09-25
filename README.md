# Установка Kubernetes
## Задание 1. Установить кластер k8s с 1 master node
Инфраструктура для Kubernetes-кластера разворачивается в **Yandex Cloud** 
с использованием **Terraform**.

Конфигурация инфраструктуры описывается декларативно в Terraform-манифестах.

После создания виртуальных машин установка и настройка Kubernetes выполняется 
с использованием **Kubespray**.

Запуск Kubespray автоматизирован средствами Terraform, что позволяет выполнить 
развёртывание Kubernetes-кластера в рамках единого процесса создания инфраструктуры.

### Требования

- 1 master node;
- 4 worker nodes;
- CRI — `containerd`;
- `etcd` запускается на master node;
- Kubernetes устанавливается с использованием Kubespray.

<img width="1478" height="609" alt="8" src="https://github.com/user-attachments/assets/e86e34a5-657d-4fee-8813-025262075182" />

### Запуск проекта
```bash
terraform -chdir=/hw-kub-09/terraform/vpc apply
terraform -chdir=/hw-kub-09/terraform apply
``` 

