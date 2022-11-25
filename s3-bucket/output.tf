output "s3_bucket-arn"{
    value = aws_s3_bucket.tf_state.arn
    description = "the arn of the state bucket"
}

output "dynamodb_table_name" {
    value = aws_dynamodb_table.tf_locks.name
    description = "the name of the dynamodb table"
} 