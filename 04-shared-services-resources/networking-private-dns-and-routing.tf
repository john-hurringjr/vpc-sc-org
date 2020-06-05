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
  Private Shared VPC Host - Prod - DNS & Routing
 *****************************************/
module "private_prod_vpc_private_apis_dns" {
  source            = "github.com/john-hurringjr/test-modules/networking/dns/internal-private-apis"
  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
  network_self_link = google_compute_network.private_prod_vpc.self_link
}

module "private_prod_vpc_private_apis_routing" {
  source            = "github.com/john-hurringjr/test-modules/networking/routing/private-apis"
  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
  network_self_link = google_compute_network.private_prod_vpc.self_link
}

/******************************************
  Private Shared VPC Host - Non-Prod - DNS & Routing
 *****************************************/
module "private_non_prod_vpc_private_apis_dns" {
  source            = "github.com/john-hurringjr/test-modules/networking/dns/internal-private-apis"
  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  network_self_link = google_compute_network.private_non_prod_vpc.self_link
}

module "private_non_prod_vpc_private_apis_routing" {
  source            = "github.com/john-hurringjr/test-modules/networking/routing/private-apis"
  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  network_self_link = google_compute_network.private_non_prod_vpc.self_link
}