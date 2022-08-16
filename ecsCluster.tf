# ecs cluster

resource "aws_ecs_cluster" "cluster" {
  name = "project-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "ecs-fargate" {
  cluster_name = aws_ecs_cluster.cluster.name

  capacity_providers = ["FARGATE_SPOT","FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
  }
}

module "ecs-fargate" {
  source  = "umotif-public/ecs-fargate/aws"
  version = "~> 6.1.0"

  name_prefix        = "proj19-ecs-fargate"
  vpc_id             = aws_vpc.week19VPC.id
  private_subnet_ids = [aws_subnet.sub1.id, aws_subnet.sub2.id]

  cluster_id = aws_ecs_cluster.cluster.id

  task_container_image   = "centos:latest"
  task_definition_cpu    = 256
  task_definition_memory = 512

  task_container_port             = 80
  task_container_assign_public_ip = true

  load_balanced = false

  target_groups = [
    {
      target_group_name = "ecs-tg"
      container_port    = 80
    }
  ]

  health_check = {
    port = "traffic-port"
    path = "/"
  }

  tags = {
    Environment = "test"
    Project     = "Test"
  }
}
