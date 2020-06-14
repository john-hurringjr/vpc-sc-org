/**
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
  Cluster (Placing in restricted APIs prj)
 *****************************************/
resource "google_container_cluster" "gke_cluster_1" {
  provider                  = google-beta
  project                   = data.terraform_remote_state.rs03_shared_services_projects.outputs.gke_cluster_non_prod_project_id
  name                      = var.gke_cluster_test_1_name
  location                  = var.region_2
  remove_default_node_pool  = true
  network                   = google_compute_network.restricted_non_prod_vpc.self_link
  subnetwork                = module.restricted_non_prod_vpc_subnet_2.subnet_self_link
  initial_node_count        = 1

  // For testing purposes I've opened up all of non-prod and on prem IP addresses
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.gke_cluster_test_1_master_authorized_cidr_1
    }
    cidr_blocks {
      cidr_block = var.gke_cluster_test_1_master_authorized_cidr_2
    }
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.gke_cluster_test_1_master_cidr
  }

  // The name for the ranges was difficult. If you select IPs then it will
  // create those secondary ranges for you. BUt we'll be using ones already
  // created. Therefore we need to use name. I thought about how to thread these
  // out, but when outputting, I could not find a way to select specific secondary
  // ranges. So, I have a convention for naming which starts with the region
  // and then adds either -pod-ips or -services-ips.
  ip_allocation_policy {
    cluster_secondary_range_name  = "${var.region_2}-pod-ips"
    services_secondary_range_name = "${var.region_2}-services-ips"
  }

  master_auth {
    username = var.gke_cluster_test_1_username
    password = var.gke_cluster_test_1_password
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  addons_config {
    istio_config {
      disabled = false
    }
  }

}

/******************************************
  GKE - Node Pool - 1 - Service Account
 *****************************************/

resource "google_service_account" "gke_cluster_1_node_pool_1_service_account" {
  project     = data.terraform_remote_state.rs03_shared_services_projects.outputs.gke_cluster_non_prod_project_id
  account_id  = "gke-node-pool-1"
}


/******************************************
  GKE - Node Pool - 1
 *****************************************/

resource "google_container_node_pool" "gke_cluster_1_node_pool_1" {
  project = data.terraform_remote_state.rs03_shared_services_projects.outputs.gke_cluster_non_prod_project_id
  location = var.region_2
  cluster = google_container_cluster.gke_cluster_1.name
  node_count = 5

  autoscaling {
    max_node_count = 10
    min_node_count = 3
  }

  upgrade_settings {
    max_surge       = 2
    max_unavailable = 2
  }

  management {
    auto_repair   = true
    auto_upgrade  = true
  }

  node_config {
    disk_size_gb  = 25
    disk_type     = "pd-ssd"
    machine_type  = "n1-standard-2"
    labels = {
      node-pool = "test-node-pool-1"
    }
    service_account = google_service_account.gke_cluster_1_node_pool_1_service_account.email

  }

}