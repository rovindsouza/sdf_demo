terraform {
  backend "gcs" {
    bucket = "chainlink-storage-bucket"
    prefix = "terraform/state"
  }
}
