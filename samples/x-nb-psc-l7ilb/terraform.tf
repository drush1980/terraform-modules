terraform {
  backend "gcs" {
    bucket  = "csr-ha-tf"
    prefix  = "terraform/state"
  }
}
