terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
    region     = "eu-west-1"
}

resource "aws_vpc" "vpc-test" {
  cidr_block = "10.10.0.0/16"


  tags = {
    Name = "ExampleAppServerInstance"
  }
}