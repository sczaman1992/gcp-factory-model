terraform {
  required_version = ">= 1.3.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.61.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.61.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.0"
    }
  }
}
