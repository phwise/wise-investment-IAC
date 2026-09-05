resource "aws_sqs_queue" "this" {
  name = var.queue_name
}

data "aws_iam_policy_document" "sqs" {
  statement {
    sid    = "AllowS3ToSendMessage"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions   = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.this.arn]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [var.s3_bucket_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
}

data "aws_caller_identity" "current" {}

resource "aws_sqs_queue_policy" "this" {
  queue_url = aws_sqs_queue.this.url
  policy    = data.aws_iam_policy_document.sqs.json
}

resource "aws_s3_bucket_notification" "this" {
  bucket = var.s3_bucket_id

  queue {
    queue_arn = aws_sqs_queue.this.arn
    events    = ["s3:ObjectCreated:*"]

    filter_prefix = var.filter_prefix
    filter_suffix = var.filter_suffix
  }

  depends_on = [
    aws_sqs_queue_policy.this
  ]
}

