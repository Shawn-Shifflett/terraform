#providers 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.26.0"
    }


    docker = {
      source  = "kreuzwerker/docker"
      version = "2.20.2"
    }
  }
}

provider "docker" {
}

provider "aws" {
  region = "us-east-1"
}
