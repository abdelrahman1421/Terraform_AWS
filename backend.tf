terraform {
  backend "s3" {
    bucket = "ttff"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "ttff"
  }
}
