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
  Restricted Shared VPC Host - Prod - VPC and Subnets
 *****************************************/
# Network
resource "google_compute_network" "restricted_prod_vpc" {
  project                         = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
  name                            = var.restricted_prod_vpc_name
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

# Subnets
module "restricted_prod_vpc_subnet_1" {
  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
  project_id            = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
  network_self_link     = google_compute_network.restricted_prod_vpc.self_link
  network_name          = google_compute_network.restricted_prod_vpc.name
  region                = var.region_1
  cidr                  = var.restricted_prod_vpc_subnet_1_cidr_primary
  vpc_flow_log_interval = var.restricted_prod_vpc_flow_log_interval
  vpc_flow_log_sampling = var.restricted_prod_vpc_flow_log_sampling
  subnet_number         = "1"
}

module "restricted_prod_vpc_subnet_2" {
  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
  project_id            = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
  network_self_link     = google_compute_network.restricted_prod_vpc.self_link
  network_name          = google_compute_network.restricted_prod_vpc.name
  region                = var.region_2
  cidr                  = var.restricted_prod_vpc_subnet_2_cidr_primary
  vpc_flow_log_interval = var.restricted_prod_vpc_flow_log_interval
  vpc_flow_log_sampling = var.restricted_prod_vpc_flow_log_sampling
  subnet_number         = "1"
}

/******************************************
  Restricted Shared VPC Host - Non-Prod - VPC and Subnets
 *****************************************/
# Network
resource "google_compute_network" "restricted_non_prod_vpc" {
  project                         = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  name                            = "restricted-non-prod-vpc"
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

# Subnets
module "restricted_non_prod_vpc_subnet_1" {
  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
  project_id            = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  network_self_link     = google_compute_network.restricted_non_prod_vpc.self_link
  network_name          = google_compute_network.restricted_non_prod_vpc.name
  region                = var.region_1
  cidr                  = var.restricted_non_prod_vpc_subnet_1_cidr_primary
  vpc_flow_log_interval = var.restricted_non_prod_vpc_flow_log_interval
  vpc_flow_log_sampling = var.restricted_non_prod_vpc_flow_log_sampling
  subnet_number         = "1"
}

module "restricted_non_prod_vpc_subnet_2" {
  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
  project_id            = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  network_self_link     = google_compute_network.restricted_non_prod_vpc.self_link
  network_name          = google_compute_network.restricted_non_prod_vpc.name
  region                = var.region_2
  cidr                  = var.restricted_non_prod_vpc_subnet_2_cidr_primary
  vpc_flow_log_interval = var.restricted_non_prod_vpc_flow_log_interval
  vpc_flow_log_sampling = var.restricted_non_prod_vpc_flow_log_sampling
  subnet_number         = "1"
}
