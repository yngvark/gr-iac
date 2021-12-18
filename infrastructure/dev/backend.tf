provider "aws" {
  region     = "eu-north-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  # Comment out this when running tf plan and tf apply the first time
  backend "s3" {
    bucket = "gridwalls-terraform-state3"
    key    = "terraform/remote_state/terraform.tfstate"
    region = "eu-north-1"

    dynamodb_table = "gridwalls-tfstate-locks"
    encrypt        = true
  }
}
