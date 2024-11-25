terraform {
  backend "s3" {
    bucket = "tf-state-sync-nk"
    key    = "Proj3-Sync/backend"
    region = "us-east-1"
  }
}