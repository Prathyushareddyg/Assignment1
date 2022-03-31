provider "aws" {
    region = "ap-south-1"
    access_key = "AKIA4JRH66NEWADZ6WQ3"
    secret_key = ""
}
resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-assignmentone-bucket-one"
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
