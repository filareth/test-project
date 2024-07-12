provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Owner         = "Vlad"
      "Create by"   = "Terraform"
      Project       = "Demo"
    }
  }
}
