# provider.tf
# Connect to AWS
#
provider "aws" { }

# default provider (no alias specified)
/*
provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  region                  = "us-east-1"
}

# sample credential file...
# it can be created via AWS CLI command: aws configure
# it is referenced above in the 'profile' property

$ cat ~/.aws/credentials
[default]
aws_access_key_id = ABCDEFGHIJKLMNOPQRST
aws_secret_access_key = ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmn
*/

# aliased provider
# NOTE: do not place key values into source code.
/*
provider "aws" {
  alias      = "staging"
  region     = "us-east-1"
  access_key = "ABCDEFGHIJKLMNOPQRST"
  secret_key = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmn"
}
*/
