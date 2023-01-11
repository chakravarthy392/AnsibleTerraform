terraform {
  backend "s3" {
    bucket = "terrafstatfile"
    key    = "remotedemo.tfstate"
    region = "us-east-1"
    access_key = "AKIA5NFU5LOT6ZVG2KSQ"
    secret_key = "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"
    dynamodb_table = "s3-state-lock"
  }
}
