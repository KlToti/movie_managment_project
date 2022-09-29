terraform {
  backend "s3" {
    bucket = "ta-terraform-tfstates-686520628199"
    key    = "movie-db/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}
