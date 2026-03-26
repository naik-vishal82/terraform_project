terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "${var.AWS_REGION}"
  access_key = "${var.acc-key}"
  secret_key = "${var.sec-key}"
}
