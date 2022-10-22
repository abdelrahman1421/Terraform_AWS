provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "eu-central-1"
}