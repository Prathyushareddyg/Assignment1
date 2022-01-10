provider "aws" {
    region = "us-east-1"
    access_key = "AKIAVI5KGKVD26Y72B"
    secret_key = "U/FoUQuvPa8WLQ4VkZmVejQgWNUF6+mR2qZt9D"
}
resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-assignmentone-bucket"
}

resource "aws_s3_bucket_policy" "allow_access_from_another_user" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.s3_read_permissions.json
}

data "aws_iam_policy_document" "s3_read_permissions" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["362744796487"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.bucket.arn,
      "${aws_s3_bucket.bucket.arn}/*",
    ]
  }
}
