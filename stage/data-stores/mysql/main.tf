provider "aws" {
    region = "us-east-2"
}

resource "aws_db_instance" "sql_example" {
    identifier_prefix = "sql-up"
    engine = "mysql"
    allocated_storage = 10
    instance_class = "db.t2.micro"
    name = "exam_db"
    username = "admin"

  password = data.aws_secretmanager_secret_version.db_pass.secret_string
}

data "aws_secretmanager_secret_version" "db_pass"{
    secret_id = "db-password"
}