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



/*
  HA VPN can become costs if left up 24x7 for a simple test environment
  Therefore, it is highly recommend and asked that you use this file
  to comment the VPN in/out as needed. Declared variables are included
  in this file as Terraform will stop supporting declared variables that
  are unused (and if you comment out the code they will be unused).

  As mentioned in the readme, you will need to grant your TF service
  account the appropriate permissions to your "on prem" gcp project.
  Network Admin & Compute Security Admin

*/

///******************************************
// Declared Variable - Private HA VPN
// *****************************************/
//# Prod
//variable "private_on_prem_prod_vpc_router_region_1_asn" {
//  default = 4200000300
//}
//variable "private_on_prem_prod_vpc_router_region_2_asn" {
//  default = 4200000301
//}
//
//variable "private_prod_vpc_router_region_1_asn" {
//  default = 4200000800
//}
//variable "private_prod_vpc_router_region_2_asn" {
//  default = 4200000801
//}
//
//variable "vpn_on_prem_private_prod_region_1_shared_secret_tunnel_1" {}
//variable "vpn_on_prem_private_prod_region_1_shared_secret_tunnel_2" {}
//variable "vpn_on_prem_private_prod_region_2_shared_secret_tunnel_1" {}
//variable "vpn_on_prem_private_prod_region_2_shared_secret_tunnel_2" {}
//
//# Non-Prod
//variable "private_on_prem_non_prod_vpc_router_region_1_asn" {
//  default = 4200000400
//}
//variable "private_on_prem_non_prod_vpc_router_region_2_asn" {
//  default = 4200000501
//}
//
//variable "private_non_prod_vpc_router_region_1_asn" {
//  default = 4200000900
//}
//variable "private_non_prod_vpc_router_region_2_asn" {
//  default = 4200000901
//}
//
//variable "vpn_on_prem_private_non_prod_region_1_shared_secret_tunnel_1" {}
//variable "vpn_on_prem_private_non_prod_region_1_shared_secret_tunnel_2" {}
//variable "vpn_on_prem_private_non_prod_region_2_shared_secret_tunnel_1" {}
//variable "vpn_on_prem_private_non_prod_region_2_shared_secret_tunnel_2" {}
//
///******************************************
//  Private On Prem HA VPN with Prod VPC
// *****************************************/
//
//module "private_ha_vpn_on_prem_with_prod_vpc_region_1" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = var.on_prem_project_id
//  network_1_self_link       = google_compute_network.private_on_prem_vpc_prod.self_link
//  network_1_name            = google_compute_network.private_on_prem_vpc_prod.name
//  network_1_router_bgp_asn  = var.private_on_prem_prod_vpc_router_region_1_asn
//  project_2_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
//  network_2_self_link       = google_compute_network.private_prod_vpc.self_link
//  network_2_name            = google_compute_network.private_prod_vpc.name
//  network_2_router_bgp_asn  = var.private_prod_vpc_router_region_1_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_private_prod_region_1_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_private_prod_region_1_shared_secret_tunnel_2
//  region                    = var.region_1
//  custom_range              = "199.36.153.8/30" #Private: 199.36.153.8/30
//}
//
//module "private_ha_vpn_on_prem_with_prod_vpc_region_2" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = var.on_prem_project_id
//  network_1_self_link       = google_compute_network.private_on_prem_vpc_prod.self_link
//  network_1_name            = google_compute_network.private_on_prem_vpc_prod.name
//  network_1_router_bgp_asn  = var.private_on_prem_prod_vpc_router_region_2_asn
//  project_2_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
//  network_2_self_link       = google_compute_network.private_prod_vpc.self_link
//  network_2_name            = google_compute_network.private_prod_vpc.name
//  network_2_router_bgp_asn  = var.private_prod_vpc_router_region_2_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_private_prod_region_2_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_private_prod_region_2_shared_secret_tunnel_2
//  region                    = var.region_2
//  custom_range              = "199.36.153.8/30" #Private: 199.36.153.8/30
//}
//
///******************************************
//  Private On Prem HA VPN with Non-Prod VPC
// *****************************************/
//
//module "private_vpc_sc_ha_vpn_on_prem_with_non_prod_vpc_region_1" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = var.on_prem_project_id
//  network_1_self_link       = google_compute_network.private_on_prem_vpc_non_prod.self_link
//  network_1_name            = google_compute_network.private_on_prem_vpc_non_prod.name
//  network_1_router_bgp_asn  = var.private_on_prem_non_prod_vpc_router_region_1_asn
//  project_2_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
//  network_2_self_link       = google_compute_network.private_non_prod_vpc.self_link
//  network_2_name            = google_compute_network.private_non_prod_vpc.name
//  network_2_router_bgp_asn  = var.private_non_prod_vpc_router_region_1_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_private_non_prod_region_1_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_private_non_prod_region_1_shared_secret_tunnel_2
//  region                    = var.region_1
//  custom_range              = "199.36.153.8/30" #Private: 199.36.153.8/30
//}
//
//module "private_vpc_sc_ha_vpn_on_prem_with_non_prod_vpc_region_2" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = var.on_prem_project_id
//  network_1_self_link       = google_compute_network.private_on_prem_vpc_non_prod.self_link
//  network_1_name            = google_compute_network.private_on_prem_vpc_non_prod.name
//  network_1_router_bgp_asn  = var.private_on_prem_non_prod_vpc_router_region_2_asn
//  project_2_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
//  network_2_self_link       = google_compute_network.private_non_prod_vpc.self_link
//  network_2_name            = google_compute_network.private_non_prod_vpc.name
//  network_2_router_bgp_asn  = var.private_non_prod_vpc_router_region_2_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_private_non_prod_region_2_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_private_non_prod_region_2_shared_secret_tunnel_2
//  region                    = var.region_2
//  custom_range              = "199.36.153.8/30" #RPrivate: 199.36.153.8/30
//}