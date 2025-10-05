resource "aws_s3_bucket" "my_bucket" {
    bucket_prefix = var.bucket_prefix
    tags =var.tags 
    
}


resource "aws_s3_bucket_versioning" "s3_versioning" {
    bucket = aws_s3_bucket.my_bucket.id
    versioning_configuration {
      status = var.versioning ? "Enabled" : "Suspended"
    }

  
}