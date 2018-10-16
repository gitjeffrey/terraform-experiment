# main.tf
# Create AWS resources...
#
resource "aws_instance" "terraform-experiment-vm-001" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  provider      = "aws"
  tags {
    Name        = "io-autostructure-jeff-terraform-experiment-vm-001"
    Environment = "Dev"
  }
}

# e.g. specify a different provider using their alias (aws provider with alias 'staging')
/*
resource "aws_instance" "io-autostructure-web" {
  ami           = "ami-0df51bbdb09841968"
  instance_type = "t2.micro"
  provider      = "aws.staging"
  tags {
    Name = "HelloWorld"
  }
}
*/
