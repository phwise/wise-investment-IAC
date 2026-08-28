terraform {
  backend "s3" {
    bucket       = "wiseinvestment-terraform-state-894401215822"
    key          = "wise-investment/dev/terraform.tfstate"
    region       = "af-south-1"
    encrypt      = true
    use_lockfile = true
  }
}