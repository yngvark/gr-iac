provider "aws" {
  region     = "eu-north-1"
}

# Use S3 for storing remote state
resource "aws_s3_bucket" "terraform-state" {
  bucket = "gridwalls-terraform-state3"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    project        = "yngvar-fagprosjekt"
  }
}

# Use DynamoDB for storing state locks
resource "aws_dynamodb_table" "tfstate-locks" {
  name     = "gridwalls-tfstate-locks"
  hash_key = "LockID"

  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    project        = "yngvar-fagprosjekt"
  }
}
