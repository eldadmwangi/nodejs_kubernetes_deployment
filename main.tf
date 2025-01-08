provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_container_cluster" "gke_cluster" {
  name               = "gke-cluster"
  location           = var.region
  initial_node_count = 1  # Reduced to minimize resource usage
}

resource "google_container_node_pool" "node_pool" {
  name     = "node-pool-test"
  cluster  = google_container_cluster.gke_cluster.name
  location = google_container_cluster.gke_cluster.location
  node_count = 2  # Reduced number of nodes

  node_config {
    disk_size_gb  = 10           # Reduced disk size
    machine_type  = "e2-small"   # Smaller machine type for cost efficiency
    disk_type     = "pd-standard"  # Switched to standard disk
    preemptible   = true         # Optional: Use preemptible VMs for cost savings
  }
}

output "kubeconfig" {
  value = google_container_cluster.gke_cluster.name
}
