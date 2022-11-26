provider "aws" {
    region = "us-east-2"
}

resource "aws_s3_bucket" "tf_state"{

bucket = "tf-state-bucket-3699"

# prevent accidental deletion


# state filed enable versioning of history
versioning {
  enabled = true
}

#enable server side encryption

server_side_encryption_configuration {
  rule{
    apply_server_side_encryption_by_default{
            sse_algorithm = "AES256"
    }
  }
}   
}

resource "aws_dynamodb_table" "tf_locks" {
    name = "tf-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
  
}

terraform {
  backend "s3" {
    bucket = "tf-state-bucket-3699"
    key = "s3-bucket/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "tf-locks"
    encrypt = true
  }
}