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
  Private Shared VPC Host - Prod - VPC and Subnets
 *****************************************/
# Network
resource "google_compute_network" "private_prod_vpc" {
  project                         = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
  name                            = var.private_prod_vpc_name
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

# Subnets
module "private_prod_vpc_subnet_1" {
  source                  = "github.com/john-hurringjr/test-modules/networking/subnet/gke"
  project_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
  network_self_link       = google_compute_network.private_prod_vpc.self_link
  network_name            = google_compute_network.private_prod_vpc.name
  region                  = var.region_1
  primary_cidr            = var.prod_vpc_subnet_1_cidr_primary
  alias_gke_pod_cidr      = var.prod_vpc_subnet_1_cidr_pods
  alias_gke_service_cidr  = var.prod_vpc_subnet_1_cidr_services
  vpc_flow_log_interval   = var.prod_vpc_flow_log_interval
  vpc_flow_log_sampling   = var.prod_vpc_flow_log_sampling
  subnet_number           = "1"
}

module "private_prod_vpc_subnet_2" {
  source                  = "github.com/john-hurringjr/test-modules/networking/subnet/gke"
  project_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
  network_self_link       = google_compute_network.private_prod_vpc.self_link
  network_name            = google_compute_network.private_prod_vpc.name
  region                  = var.region_2
  primary_cidr            = var.prod_vpc_subnet_2_cidr_primary
  alias_gke_pod_cidr      = var.prod_vpc_subnet_2_cidr_pods
  alias_gke_service_cidr  = var.prod_vpc_subnet_2_cidr_services
  vpc_flow_log_interval   = var.prod_vpc_flow_log_interval
  vpc_flow_log_sampling   = var.prod_vpc_flow_log_sampling
  subnet_number           = "1"
}

module "private_prod_vpc_subnet_3" {
  source                  = "github.com/john-hurringjr/test-modules/networking/subnet/gke"
  project_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
  network_self_link       = google_compute_network.private_prod_vpc.self_link
  network_name            = google_compute_network.private_prod_vpc.name
  region                  = var.region_3
  primary_cidr            = var.prod_vpc_subnet_3_cidr_primary
  alias_gke_pod_cidr      = var.prod_vpc_subnet_3_cidr_pods
  alias_gke_service_cidr  = var.prod_vpc_subnet_3_cidr_services
  vpc_flow_log_interval   = var.prod_vpc_flow_log_interval
  vpc_flow_log_sampling   = var.prod_vpc_flow_log_sampling
  subnet_number           = "1"
}

module "private_prod_vpc_subnet_4" {
  source                  = "github.com/john-hurringjr/test-modules/networking/subnet/gke"
  project_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
  network_self_link       = google_compute_network.private_prod_vpc.self_link
  network_name            = google_compute_network.private_prod_vpc.name
  region                  = var.region_4
  primary_cidr            = var.prod_vpc_subnet_4_cidr_primary
  alias_gke_pod_cidr      = var.prod_vpc_subnet_4_cidr_pods
  alias_gke_service_cidr  = var.prod_vpc_subnet_4_cidr_services
  vpc_flow_log_interval   = var.prod_vpc_flow_log_interval
  vpc_flow_log_sampling   = var.prod_vpc_flow_log_sampling
  subnet_number           = "1"
}

/******************************************
  Private Shared VPC Host - Non-Prod - VPC and Subnets
 *****************************************/
# Network
resource "google_compute_network" "private_non_prod_vpc" {
  project                         = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  name                            = var.private_non_prod_vpc_name
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

# Subnets
module "private_non_prod_vpc_subnet_1" {
  source                  = "github.com/john-hurringjr/test-modules/networking/subnet/gke"
  project_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  network_self_link       = google_compute_network.private_non_prod_vpc.self_link
  network_name            = google_compute_network.private_non_prod_vpc.name
  region                  = var.region_1
  primary_cidr            = var.non_prod_vpc_subnet_1_cidr_primary
  alias_gke_pod_cidr      = var.non_prod_vpc_subnet_4_cidr_pods
  alias_gke_service_cidr  = var.non_prod_vpc_subnet_4_cidr_services
  vpc_flow_log_interval   = var.non_prod_vpc_flow_log_interval
  vpc_flow_log_sampling   = var.non_prod_vpc_flow_log_sampling
  subnet_number           = "1"
}

module "private_non_prod_vpc_subnet_2" {
  source                  = "github.com/john-hurringjr/test-modules/networking/subnet/gke"
  project_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  network_self_link       = google_compute_network.private_non_prod_vpc.self_link
  network_name            = google_compute_network.private_non_prod_vpc.name
  region                  = var.region_2
  primary_cidr            = var.non_prod_vpc_subnet_2_cidr_primary
  alias_gke_pod_cidr      = var.non_prod_vpc_subnet_2_cidr_pods
  alias_gke_service_cidr  = var.non_prod_vpc_subnet_2_cidr_services
  vpc_flow_log_interval   = var.non_prod_vpc_flow_log_interval
  vpc_flow_log_sampling   = var.non_prod_vpc_flow_log_sampling
  subnet_number           = "1"
}

module "private_non_prod_vpc_subnet_3" {
  source                  = "github.com/john-hurringjr/test-modules/networking/subnet/gke"
  project_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  network_self_link       = google_compute_network.private_non_prod_vpc.self_link
  network_name            = google_compute_network.private_non_prod_vpc.name
  region                  = var.region_3
  primary_cidr            = var.non_prod_vpc_subnet_3_cidr_primary
  alias_gke_pod_cidr      = var.non_prod_vpc_subnet_3_cidr_pods
  alias_gke_service_cidr  = var.non_prod_vpc_subnet_3_cidr_services
  vpc_flow_log_interval   = var.non_prod_vpc_flow_log_interval
  vpc_flow_log_sampling   = var.non_prod_vpc_flow_log_sampling
  subnet_number           = "1"
}

module "private_non_prod_vpc_subnet_4" {
  source                  = "github.com/john-hurringjr/test-modules/networking/subnet/gke"
  project_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  network_self_link       = google_compute_network.private_non_prod_vpc.self_link
  network_name            = google_compute_network.private_non_prod_vpc.name
  region                  = var.region_4
  primary_cidr            = var.non_prod_vpc_subnet_4_cidr_primary
  alias_gke_pod_cidr      = var.non_prod_vpc_subnet_4_cidr_pods
  alias_gke_service_cidr  = var.non_prod_vpc_subnet_4_cidr_services
  vpc_flow_log_interval   = var.non_prod_vpc_flow_log_interval
  vpc_flow_log_sampling   = var.non_prod_vpc_flow_log_sampling
  subnet_number           = "1"
}