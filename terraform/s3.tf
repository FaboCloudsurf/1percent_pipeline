# resource "aws_s3_bucket" "one_percent_s3" {
#   bucket = "one-percent-s3-tf"

#   tags = {
#     Name        = "one percent s3"
#     Environment = "prod"
#   }
# }

terraform {
  backend "s3" {
    bucket = "mentis-backend-bucket"
    key    = "final_project_onepercent/terraform/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}