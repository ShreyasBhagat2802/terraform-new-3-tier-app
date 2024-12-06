terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ShreyasBhagat28"
    workspaces {
      prefix = "terraform-"
    }
  }
}
