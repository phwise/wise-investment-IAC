module "s3_bucket" {
  source = "../../modules/s3-bucket"

  bucket_name = "wiseinvestment-dev-test-894401215822"

  tags = {
    Name        = "wise-investment-development"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "wise-investment"
  }
}

module "financial_data_notification" {
  source = "../../modules/s3-sqs-notification"

  s3_bucket_arn = module.s3_bucket.bucket_arn
  s3_bucket_id  = module.s3_bucket.bucket_id

  queue_name    = "wise-investment-financial-data-dev"
  filter_prefix = "financial-data/"
}