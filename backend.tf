# s3 backend configuration to support remote, shared-state storage

terraform {
  backend "s3" {
      bucket  = "terraform-state-bucket.autostructure.io"
      key     = "terraform.tfstate"
      region  = "us-east-1"
      profile = "default"
    }
}

resource "aws_s3_bucket" "state-bucket" {
  bucket = "terraform-state-bucket.autostructure.io"
  acl    = "private"  # private, public-read, public-read-write, authorized_read, et al.

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
