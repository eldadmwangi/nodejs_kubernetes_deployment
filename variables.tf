variable "project" {
    description = "The GCP project ID"
    type = string
}

variable "region" {
  description = "The GCP region where the resources will be deployed"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone where the resources will be deployed"
  type        = string
  default     = "us-central1-a"
}