# pull image from docker
resource "docker_image" "pull-centos" {
  name = "centos:latest"
}
