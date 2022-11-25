resource "aws_instance" "example" {
  ami = "ami-0beaa649c482330f7"
  instance_type = "t2.micro"
}

terraform {
  backend "s3" {
    bucket = "tf-state-bucket-3699"
    key = "workspace-example/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "tf-locks"
    encrypt = true
  }
}