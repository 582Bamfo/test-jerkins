terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
  }
  # backend "s3" {
  #     bucket = "body-425"
  #     key    = "test-jenkins/terraform-cicd/statefile"
  #     region = "eu-west-2"
  # }
}

