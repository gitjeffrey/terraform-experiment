# backend.tf
# s3 backend configuration to support remote, shared-state storage
#
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

/*
# uploads local state file (terraform.tfstate) to remote state in bucket...
# NOTE:
# ONLY USE THIS IF U PLAN ON REPLACING THE REMOTE STATE FILE
# i could have destroyed objects not found in my local state,
# since remote resources dont exist in my local, they will be destroyed.
# this is because the local file will be missing any resources that exist
# in the remote state file.
# Probably need to import resources first.
# Only use to migrate local to remote?!?!

resource "aws_s3_bucket_object" "state-bucket-file" {
  bucket = "terraform-state-bucket.autostructure.io"
  acl    = "private"  # private, public-read, public-read-write, authorized_read, et al.
  key    = "terraform.tfstate"
  source = "./.terraform/terraform.tfstate"
  content_type = "application/json"
  depends_on = [
      "aws_s3_bucket.terraform-state-bucket",
  ]
}
*/
