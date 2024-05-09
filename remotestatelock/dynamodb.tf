resource "aws_dynamodb_table" "terraform_statelock" {
  name           = var.dynamoDB_name
  billing_mode   = "PROVISIONED"
  read_capacity  = "30"
  write_capacity = "30"
  attribute {
    name = "noteId"
    type = "S"
  }
  hash_key = "LockID"
}