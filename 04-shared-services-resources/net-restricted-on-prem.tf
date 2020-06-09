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
///******************************************
//  Restricted On Prem VPC - Prod
// *****************************************/
//resource "google_compute_network" "restricted_on_prem_vpc_prod" {
//  project                         = var.on_prem_project_id
//  name                            = var.restricted_on_prem_prod_vpc_name
//  routing_mode                    = "GLOBAL"
//  auto_create_subnetworks         = false
//  delete_default_routes_on_create = true
//}
//
//module "restricted_on_prem_vpc_prod_subnet_1" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = var.on_prem_project_id
//  network_self_link     = google_compute_network.restricted_on_prem_vpc_prod.self_link
//  network_name          = google_compute_network.restricted_on_prem_vpc_prod.name
//  region                = var.region_1
//  cidr                  = var.on_prem_prod_vpc_subnet_1_cidr
//  vpc_flow_log_interval = var.on_prem_prod_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.on_prem_prod_vpc_flow_log_sampling
//  subnet_number         = "1"
//  private_google_access = "false"
//}
//
//module "restricted_on_prem_vpc_prod_subnet_2" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = var.on_prem_project_id
//  network_self_link     = google_compute_network.restricted_on_prem_vpc_prod.self_link
//  network_name          = google_compute_network.restricted_on_prem_vpc_prod.name
//  region                = var.region_2
//  cidr                  = var.on_prem_prod_vpc_subnet_2_cidr
//  vpc_flow_log_interval = var.on_prem_prod_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.on_prem_prod_vpc_flow_log_sampling
//  subnet_number         = "1"
//  private_google_access = "false"
//}
//
//module "restricted_on_prem_vpc_prod_firewall_allow_iap_all" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-iap"
//  project_id        = var.on_prem_project_id
//  network_self_link = google_compute_network.restricted_on_prem_vpc_prod.self_link
//  network_name      = google_compute_network.restricted_on_prem_vpc_prod.name
//}
//
//module "restricted_on_prem_vpc_prod_firewall_allow_ingress_rfc1918_limited" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc1918-limited"
//  project_id        = var.on_prem_project_id
//  network_self_link = google_compute_network.restricted_on_prem_vpc_prod.self_link
//  network_name      = google_compute_network.restricted_on_prem_vpc_prod.name
//}
//
//module "restricted_on_prem_prod_vpc_restricted_apis_dns" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/dns/internal-restricted-apis"
//  project_id                = var.on_prem_project_id
//  network_self_link         = google_compute_network.restricted_on_prem_vpc_prod.self_link
//  unique_zone_name_addition = "-prod"
//}
//
///******************************************
//  Restricted On Prem VPC - Non-Prod
// *****************************************/
//resource "google_compute_network" "restricted_on_prem_vpc_non_prod" {
//  project                         = var.on_prem_project_id
//  name                            = var.restricted_on_prem_non_prod_vpc_name
//  routing_mode                    = "GLOBAL"
//  auto_create_subnetworks         = false
//  delete_default_routes_on_create = true
//}
//
//module "restricted_on_prem_non_prod_vpc_subnet_1" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = var.on_prem_project_id
//  network_self_link     = google_compute_network.restricted_on_prem_vpc_non_prod.self_link
//  network_name          = google_compute_network.restricted_on_prem_vpc_non_prod.name
//  region                = var.region_1
//  cidr                  = var.on_prem_non_prod_vpc_subnet_1_cidr
//  vpc_flow_log_interval = var.on_prem_non_prod_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.on_prem_non_prod_vpc_flow_log_sampling
//  subnet_number         = "1"
//  private_google_access = "false"
//}
//
//module "restricted_on_prem_non_prod_vpc_subnet_2" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = var.on_prem_project_id
//  network_self_link     = google_compute_network.restricted_on_prem_vpc_non_prod.self_link
//  network_name          = google_compute_network.restricted_on_prem_vpc_non_prod.name
//  region                = var.region_2
//  cidr                  = var.on_prem_non_prod_vpc_subnet_2_cidr
//  vpc_flow_log_interval = var.on_prem_non_prod_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.on_prem_non_prod_vpc_flow_log_sampling
//  subnet_number         = "1"
//  private_google_access = "false"
//}
//
//module "restricted_on_prem_non_prod_vpc_firewall_allow_iap_all" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-iap"
//  project_id        = var.on_prem_project_id
//  network_self_link = google_compute_network.restricted_on_prem_vpc_non_prod.self_link
//  network_name      = google_compute_network.restricted_on_prem_vpc_non_prod.name
//}
//
//module "restricted_on_prem_non_prod_vpc_firewall_allow_ingress_rfc1918_limited" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc1918-limited"
//  project_id        = var.on_prem_project_id
//  network_self_link = google_compute_network.restricted_on_prem_vpc_non_prod.self_link
//  network_name      = google_compute_network.restricted_on_prem_vpc_non_prod.name
//}
//
//module "restricted_on_prem_non_prod_vpc_restricted_apis_dns" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/dns/internal-restricted-apis"
//  project_id                = var.on_prem_project_id
//  network_self_link         = google_compute_network.restricted_on_prem_vpc_non_prod.self_link
//  unique_zone_name_addition = "-non-prod"
//}