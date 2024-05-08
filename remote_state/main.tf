terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

}



provider "aws" {
  region = "us-east-2"
}

resource "aws_eip" "demo_eip" {
  domain = "vpc"

}