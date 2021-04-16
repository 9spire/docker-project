data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    actions = [ "s3:GetObject" ]
    principals {
      type = "*"
      identifiers = [ "*" ]
    }
    resources = [ "arn:aws:s3:::project.rdittmar.com/*" ]
  }
}

resource "aws_s3_bucket" "website" {
  bucket = "project.rdittmar.com"  // The name of the bucket.
  acl    = "public-read"            /* Access control list for the bucket.
                                       Websites need to be publicly-available
                                       to the Internet for website hosting to
                                       work. */
  policy = "${data.aws_iam_policy_document.bucket_policy.json}"
  website {
    index_document = "index.htm"   // The root of the website.
    error_document = "error.htm"   // The page to show when people hit invalid pages.
  }
}

output "website_bucket_url" {
  value = "${aws_s3_bucket.website.website_endpoint}"
}
