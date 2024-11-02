
terraform {
  cloud {

    organization = "my-aws-terraform-org"

    workspaces {
      name = "cli-driven-dev-workflow"
    }
  }
}