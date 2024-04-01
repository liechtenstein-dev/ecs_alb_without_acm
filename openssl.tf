resource "null_resource" "openssl" {
  depends_on = [ module.s3_bucket ]
  provisioner "local-exec" {
    command = <<-EOF
      openssl genrsa -out server.key 2048
      openssl req -new -x509 -sha256 -key server.key -out server.crt -days 365
      cat server.key server.crt > server.pem
      aws s3 cp server.pem s3://${module.s3_bucket.s3_bucket_arn}/server.pem
    EOF
  }
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"
  bucket = var.bucket_openssl_name
  acl    = "private"
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
