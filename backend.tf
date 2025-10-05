terraform {
  backend "s3" {
    bucket = "my-terraform-Dev-2025-main-file-state"
    key = "main"
    region = "ap-south-1"
    dynamodb_table = "my-dynamo-table-2025"
    
  }
}