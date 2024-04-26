terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.2.1"
    }
  }
}

provider "github" {
  token = "xxxx"
}

resource "github_repository" "tf_example_repo" {
  name        = "tf-example-repo"
  description = "tf-github-example"
  visibility = "private"

  #template {
   # owner                = "github"
    #repository           = "terraform-template-module"
    #include_all_branches = true
  #}
}