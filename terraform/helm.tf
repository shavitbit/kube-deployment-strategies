provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# helm repo add softonic https://charts.softonic.io
# helm repo update
resource "helm_release" "hello-world" {
  name             = "oren-hello"
  repository       = "https://charts.softonic.io"
  chart            = "hello-world-app"
  namespace        = "hello"
  create_namespace = true
  version          = "1.2.2"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  set {
    name = "ingress.enabled"
    value = "false"
  }
}

 resource "local_file" "writefile" {
   content  = "this is a new file created by terraform on this diractory"
   filename = "${path.module}/oren.txt"
 }


