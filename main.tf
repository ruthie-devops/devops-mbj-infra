# Configure the Google Cloud provider
provider "google" {
  credentials = file("./terraform-miri-lev-447520-e4e062bfeb8d.json")
  project = "terraform-miri-lev-447520"
  region  = "me-west1"
}

# Create a Google Compute instance
resource "google_compute_instance" "example" {
  name          = "example"
  machine_type  = "e2-micro"
  zone          = "me-west1-b"
  
  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
    }
  }
  
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
