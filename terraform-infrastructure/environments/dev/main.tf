resource "aws_s3_bucket" "dev_test" {
  bucket = "wiseinvestment-dev-test-894401215822"

  tags = {
    Name        = "wise-investment-dev-test"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "wise-investment"
  }
}
