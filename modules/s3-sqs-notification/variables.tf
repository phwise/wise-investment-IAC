variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket that will send object-created notifications."
  type        = string
}

variable "s3_bucket_id" {
  description = "ID/name of the S3 bucket that will send notifications."
  type        = string
}

variable "queue_name" {
  description = "Name of the SQS queue that will receive S3 notifications."
  type        = string
}

variable "filter_prefix" {
  description = "Optional S3 object key prefix used to filter notifications."
  type        = string
  default     = null
}

variable "filter_suffix" {
  description = "Optional S3 object key suffix used to filter notifications."
  type        = string
  default     = null
}